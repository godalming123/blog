---
layout: post
author: Me - Godalming123
authorUrl: https://godalming123.github.io/new-site
title: The Dark Side
description: "See how I added a dark theme into https://github.com/pages-themes/minimal and then used it in my site."
uiTags: ["dark mode", "jekyll", "minimal theme", "cayman theme"]
searchTags: ["dark", "jekyll", "minimal", "cayman", "theme", "mode"]
type: "stuff i'm working on"
front-image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.FCx-hYGX_8GWrXo8KjVbvAHaE8%26pid%3DApi&f=1"
barba-page-namespace: post
---

**UPDATE: ** This site no longer has dark theme 😥. As I have updated my theme to use matirlize instead of minimal. But you can still like the pull request and comment your thoughts

Wondering why this site is dark? Well its becuase I am forking the
<a target="_blank" href="https://jekyllrb.com/docs/themes/">Jekyll Themes</a>
<a target="_blank" href="https://github.com/pages-themes/cayman">Cayman</a> (the theme I used to use for https://godalming123.github.io) and
<a target="_blank" href="https://github.com/pages-themes/minimal">Minimal</a>
from github pages to add dark mode! These forks add an automatic dark theme that can be changed in the **config.yaml** by setting
```
color-scheme: auto | auto-deafult-dark | dark | light
```
.

> What do the first 2 options do?
  
You ask, well the auto one will change the theme based on system theme and the other one does the same but if the browser doesnt support getting the system-theme it will deafualt to dark.
<br>
<a target="_blank" href="https://godalming123.github.io/minimal/">Try It Out</a> |
<a target="_blank" href="https://github.com/pages-themes/minimal/pull/121">Veiw The Pull</a> |
<a target="_blank" href="https://github.com/godalming123/minimal">Star The Repo</a>

{% include mailing-list-mention.html %}

## Updates
- ### I added support for changing the theme in the config.yaml
  I have just merged a branch that adds support for changing the theme in the config.yaml options just say:
  ```
  color-scheme: dark | light | auto | auto-deafualt dark
  ```
  .
  The first 2 are property's are fairly self explanatory but where it gets interesting is the last 2 as they change the theme based on the device theme the deferencew between theme lies in what they do if the device does not support changing the theme based on the device the former of the to will default to alight however the later deafualts to a dark theme.
  > always remember last is not least

  <small>
  
  by ~~Eiensteign~~ **Me. ...Just face it your small brain cant handle 1 single quote by ~~Eienstien~~ Me.**
