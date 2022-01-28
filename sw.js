const cacheName = "pwa-cache-v2";

const assets = [
  //pages
  '/blog',
  '/blog/fallback_offline',
  //icons
  '/blog/icons/blogger.svg',
  '/blog/icons/suitcase.svg',
  //js
  '/blog/assets/js/animations/pageFirstLoad.js',
  '/blog/assets/js/main.js',
  //js dependencys
  'https://unpkg.com/@barba/core',
  'https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css',
  'https://www.googletagmanager.com/gtag/js?id=G-5LX6PMSFGK',
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

//fetch event
self.addEventListener('fetch', function(event) {
    event.respondWith(
      caches.open(cacheName).then(function(cache) {
        return cache.match(event.request).then(function (response) {
          return response || fetch(event.request).then(function(response) {
            cache.put(event.request, response.clone());
            return response;
          });
        });
      })
    );
  });
  