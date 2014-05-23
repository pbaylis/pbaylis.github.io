---
layout: post
title:  "Lubuntu config"
date:   2014-05-22
categories: linux
---

Here be dragons. And my notes on my Lubuntu setup. Why Lubuntu and not Ubuntu?

1. It's a server - I don't need Unity.
   1. I don't even think I like Unity, anywho.
2. Older computer.
3. Next laptop will use Lubuntu for battery savings.

Overview:

- Lubuntu 14.04 LTS
- `sudo apt-get install git`
- `sudo apt-get install guake`
- `sudo apt-get install emacs24`
  - `M-x package-install RET org`
  - `M-x package-install RET auctex`
  - More later: AucTex, LaTeX, R, etc.
- `sudo apt-get install fonts-inconsolata`
- `sudo apt-get install xrdp`
  - Use [this](http://ubuntuforums.org/showthread.php?t=2170790) to fix checkered login problem
  - I get a PolicyKit error on remote login, but I'm not sure how to fix that
- Beautiful Soup
  - `sudo apt-get install python-bs4`
  - `sudo apt-get install python-lxml` (for better parsing)
- `sudo pip install tweepy`
- Google Chrome
  - 32-bit .deb from [Chrome site](https://www.google.com/intl/en_us/chrome/browser/)
- Dropbox
  - 32-bit .deb from [Dropbox site](https://www.dropbox.com/install?os=lnx)
- Monitorix
  - Used a .deb, see installation instructions [here](http://www.monitorix.org/doc-debian.html).
  - After installation, local URL to access monitorix is [here](http://127.0.0.1:8080/monitorix). Not sure if it's accessible from outside? Kind of cool, though. 