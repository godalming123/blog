---
---

const cacheName = "pwa-cache-v{{ site.version }}";

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

const getFromCaches = (request, fallback) =>
  caches.match(request).then((response) => response).catch((respone) => fallback)// get the content from the cache and catch with the fallback upon failure

const loadAndAddToCache = (request) =>
  fetch(request).then((response) => {
    caches.open(cacheName).then( (cache) => cache.put(request, response.clone()));//add the response to the cache
    return response;//return the response (will use catch to return a fallback if it fails)
  }).catch(() => getFromCaches('{{ "/fallback_offline" | relative_url }}', "We really are'nt able to get that right now!"));//return the fallback offline page if that returns a 404 or a last resort error text if that fails

const loadData = (request) =>
  getFromCaches(request, loadAndAddToCache(request))// look in all our caches for the response and load + add to cache as a fallback

//fetch event
self.addEventListener('fetch', function(event) {
  event.respondWith(
    loadData(event.request)
  );
});