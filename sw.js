---
---

const cacheName = "pwa-cache-v{{ site.version }}";

const assets = [
  '{{ "/fallback_offline" | relative_url }}',
];

const getFromCaches = (request, getFallback, getFallbackOnFailiure) =>
  caches.match(request).then((response) => {
    if (response != null) {//if we have a response
      return response
    }
    else {//if the data is not in the cache
      return getFallback()
    }
  }).catch((respone) => getFallbackOnFailiure())// catch with the fallback upon failure

const loadAndAddToCache = (request) =>
  fetch(request).then((response) => {
    caches.open(cacheName).then( (cache) => cache.put(request, response));//add the response to the cache
    return response.clone();//return the response
  })

const loadData = (request, isHtml) =>
  // look in all our caches for the response and load + add to cache as a fallback + load fallback page if that fails
  getFromCaches(
    request,
    () => loadAndAddToCache(request),
    () => {
      if (isHtml) {
        return getFromCaches('{{ "/fallback_offline" | relative_url }}', () => "the cached fallbck offline page was null", () => "getting the cached falback offline page failed")
      }
      else {
        return ""
      }
    }
  )

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
          .filter(key => key !== cacheName)//filter keys
          .map(key => caches.delete(key))//and delete them
      )
    })
  );
});

//fetch event
self.addEventListener('fetch', function(event) {
  event.respondWith(
    loadData(event.request, (event.request.url.indexOf('.html') > -1))
  );
});