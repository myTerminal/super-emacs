# super-emacs

![Banner](images/banner.png)

[![Docker Automated](https://img.shields.io/docker/automated/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Stars](https://img.shields.io/docker/stars/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Pulls](https://img.shields.io/docker/pulls/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Layers](https://images.microbadger.com/badges/image/myterminal/super-emacs.svg)](https://microbadger.com/images/myterminal/super-emacs)  
[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl.html)
[![Join the chat at https://gitter.im/myTerminal/super-emacs](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/myTerminal/super-emacs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

An out-of-the-box Emacs configuration with super powers, now also on Docker!

## Video

[![http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg](http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg)](http://www.youtube.com/watch?v=mRoGM_-8K9g)

## Setup

Clone the repository with

    git clone https://github.com/myTerminal/super-emacs

or download the repository as an archive and place it at your `home` directory. Once done, start Emacs or well, super Emacs.

## Docker

Pull super-emacs docker image and start `emacs`

    docker pull myterminal/super-emacs

## Features

- Minimal interface with almost everything except the window turned off
- [Material theme](https://github.com/cpaulik/emacs-material-theme) applied by default, with a readable font-size
- [MELPA](http://melpa.org) added as a package archive
- Smooth scrolling with [sublimity](https://github.com/zk-phi/sublimity)
- Navigation through buffers simplified with [winner](http://emacswiki.org/emacs/WinnerMode) and [windmove](http://emacswiki.org/emacs/WindMove).
- See command suggestions when `C-x` is pressed, using [which-key](https://github.com/justbur/emacs-which-key)
- Super-easy file system navigation with [neotree](https://github.com/jaypei/emacs-neotree)
- No more welcome screen, Emacs starts up to greet you and shows the date
- Reload file in a buffer quickly with `<f5>`

### Pre-configured packages

- [helm](https://github.com/emacs-helm/helm) to take your Emacs experience to the next level
- [sublimity](https://github.com/zk-phi/sublimity) to be able to scroll buffers smoothly
- [multiple-cursors](https://github.com/magnars/multiple-cursors.el) to be able to edit text in style
- [ace-jump-mode](https://github.com/winterTTr/ace-jump-mode) to be able to jump around quickly
- [ace-window](https://github.com/abo-abo/ace-window) to be able to switch windows visually
- [powerline](https://github.com/milkypostman/powerline) to decorate your mode-line and make it more informative
- [buffer-move](http://www.emacswiki.org/emacs/buffer-move.el) for moving buffers within windows quickly
- [auto-complete](https://github.com/auto-complete/auto-complete) for easy text editing
- [ztree](https://github.com/fourier/ztree) for an efficient directory tree comparison
- [undo-tree](https://github.com/emacsmirror/undo-tree) to be able to visualize your changes in a buffer
- [neotree](https://github.com/jaypei/emacs-neotree) to be able to spawn a tree at any directory
- [dired-launch](https://github.com/thomp/dired-launch) to be able to open files with their default applications from within `dired`
- [which-key](https://github.com/justbur/emacs-which-key) to be suggested with what you can do after pressing `C-x`
- [meta-presenter](https://github.com/myTerminal/meta-presenter) for presenting slide-shows from within Emacs
- [myterminal-controls](https://github.com/myTerminal/myterminal-controls) for quick-toggle controls at a key-stroke
- [theme-looper](https://github.com/myTerminal/theme-looper) for switching themes in style

### Key-bindings

Refer [key-bindings.el](.emacs.d/super-emacs/key-bindings.el) for all the pre-configured key-bindings for your convenience.

## References

If you are looking for a light-weight configuration, try [ample-emacs](https://github.com/myTerminal/ample-emacs).

For an even more comprehensive configuration, refer to my [dotfiles](https://github.com/myTerminal/dotfiles).
