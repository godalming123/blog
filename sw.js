---
---

const cacheName = "pwa-cache-v6";

const assets = [
  '{{ "/fallback_offline" | relative_url }}',
];

// install event
self.addEventListener('install', evt => {
  //cache files
  evt.waitUntil(
    caches.open(cacheName).then(cache => {
      cache.addAll(assets);
    })
  );
});

// activate evenet
self.addEventListener('activate', evt => {
  evt.waitUntil(
    caches.keys().then(keys => {
      return Promise.all(
        keys
          .filter(key => key !== cacheName)
          .map(key => caches.delete(key))
      )
    })
  );
});

const getFromCache = (cache, request, fallback) =>
  cache.match(request).then((response) => response).catch(() => fallback)

const loadAndAddToCache = (request, cache) =>
  fetch(request).then((response) => {
    cache.put(request, response.clone());//add the response to the cache
    return response;//return the response (will use catch to return a fallback if it fails)
  }).catch(() => getFromCache(cache, '{{ "/fallback_offline" | relative_url }}', "We really are'nt able to get that right now!"));//return the fallback offline page if that returns a 404 or a last resort error text if that fails

const loadFromCache = (request, cache) =>
  getFromCache(cache, request, loadAndAddToCache(request, cache))//return the reponse from the cache or the fetch page if it is not in the cache

const loadData = (request) =>
  caches.open(cacheName).then( (cache) => loadFromCache(request, cache) )

//fetch event
self.addEventListener('fetch', function(event) {
  event.respondWith(
    loadData(event.request)
  );
});