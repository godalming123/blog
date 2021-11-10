---
layout: post
author: Me
title: "position: sticky; an ungradurated marvel"
tags: css stichy position
type: "blog"
front-image: ""
barba-page-namespace: post
---

Hot amazement incoming! I figured out how to smoothly transistion a button from being on the viewport scrolling to fixed in the corner of the screen with just css (well theres a js intersection observer to see when you scroll past the item). But thats it! Anyway onto a demo right at you:
<iframe height="300" style="width: 100%;" scrolling="no" title="always visible button" src="https://codepen.io/godalming123/embed/YzxrpJQ?default-tab=css%2Cresult&editable=true" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href="https://codepen.io/godalming123/pen/YzxrpJQ">
  always visible button</a> by godalming123 (<a href="https://codepen.io/godalming123">@godalming123</a>)
  on <a href="https://codepen.io">CodePen</a>.
</iframe>
And with a realworld example:
<iframe height="300" style="width: 100%;" scrolling="no" title="portfiolio site" src="https://codepen.io/godalming123/embed/ExvvrxB?default-tab=css%2Cresult&editable=true" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href="https://codepen.io/godalming123/pen/ExvvrxB">
  portfiolio site</a> by godalming123 (<a href="https://codepen.io/godalming123">@godalming123</a>)
  on <a href="https://codepen.io">CodePen</a>.
</iframe>

## How it works
Give me your canny secrets! NOW! Okay, Okay. The way this works is by transistioning with `position: sticky;` so in the first example we set
```
position: sticky;
top: 0;
left: 0;
```
And when the button is still on the screen and when the `active` class is added we smoothly transition the `left` and `top` property's to:
```
top: calc(100vh - 36px - 5px);
left: calc(100vw - 210.617px - 5px);
```
Yes I know; its a bit janky - assuming the buttons width and height - but so is any js api that can do this. ...And the rest of the web as well for that matter.

## The limitations
Sadly this does have limitations and they are fairly large:
### 1. We assume that the item you are animating has a certain `width` and `height`.
Sadly I do not see any way to aviod this but when the button moves over to the corner of the screen it ahs the following styles added to it:
```
top: calc(100vh - 36px - 5px);
left: calc(100vw - 210.617px - 5px);
```
The left and top are a calc function with the propertys being the whole width or height of the screen minus the width or height of the button minus some padding and this means that you have to change the values depending on how big your item is.
### 2. This only works if the item is in the root of the page
Again sadly - but usally usefully - `position: sticky` will still keep the element in its parent container. Which means that you cannot have this button nested as it will stay in its parent container and therefor enless that is the whole height of the screen it will hide after you scroll past that parent.