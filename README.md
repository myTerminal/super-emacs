# super-emacs

![Banner](images/banner.png)

[![Docker Automated](https://img.shields.io/docker/automated/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Stars](https://img.shields.io/docker/stars/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Pulls](https://img.shields.io/docker/pulls/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Layers](https://images.microbadger.com/badges/image/myterminal/super-emacs.svg)](https://microbadger.com/images/myterminal/super-emacs)  
[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl.html)
[![Join the chat at https://gitter.im/myTerminal/super-emacs](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/myTerminal/super-emacs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

An out-of-the-box Emacs configuration with superpowers, now also on Docker!

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
- [overcast-theme](http://github.com/myTerminal/overcast-theme) applied by default, with a readable font-size
- [MELPA](http://melpa.org) added as a package archive
- Smooth scrolling with [sublimity](https://github.com/zk-phi/sublimity)
- Navigation through buffers simplified with [winner](http://emacswiki.org/emacs/WinnerMode) and [windmove](http://emacswiki.org/emacs/WindMove).
- See command suggestions when `C-x` is pressed, using [which-key](https://github.com/justbur/emacs-which-key)
- Super-easy file system navigation with [neotree](https://github.com/jaypei/emacs-neotree)
- No more welcome screen, Emacs starts up to greet you and shows the date
- Reload file in a buffer quickly with `<f5>`
- Some more configuration to improve usability

### Pre-configured packages

- [ivy](https://github.com/abo-abo/swiper) (along with counsel and swiper) to make your life easy in general
- [sublimity](https://github.com/zk-phi/sublimity) to be able to scroll buffers smoothly
- [multiple-cursors](https://github.com/magnars/multiple-cursors.el) to be able to edit text in style
- [projectile](https://github.com/bbatsov/projectile) to be able to work with projects as you do in modern IDEs
- [counsel-projectile](https://github.com/ericdanan/counsel-projectile) to enable ivy integration for projectile
- [dumb-jump](https://github.com/jacktasia/dumb-jump) to provide a 'zero-configuration' setup for "jump-to-definition"
- [ace-jump-mode](https://github.com/winterTTr/ace-jump-mode) to be able to jump around quickly
- [ace-window](https://github.com/abo-abo/ace-window) to be able to switch windows visually
- [powerline](https://github.com/milkypostman/powerline) to decorate your mode-line and make it more informative
- [buffer-move](http://www.emacswiki.org/emacs/buffer-move.el) for moving buffers within windows quickly
- [auto-complete](https://github.com/auto-complete/auto-complete) for easy text editing
- [ranger.el](https://github.com/ralesi/ranger.el) to bring a ranger-like file-manager to Emacs
- [ztree](https://github.com/fourier/ztree) for an efficient directory tree comparison
- [undo-tree](https://github.com/emacsmirror/undo-tree) to be able to visualize your changes in a buffer
- [neotree](https://github.com/jaypei/emacs-neotree) to be able to spawn a tree at any directory
- [which-key](https://github.com/justbur/emacs-which-key) to be suggested with what you can do after pressing `C-x`
- [meta-presenter](https://github.com/myTerminal/meta-presenter) for presenting slide-shows from within Emacs
- [myterminal-controls](https://github.com/myTerminal/myterminal-controls) for quick-toggle controls at a key-stroke
- [theme-looper](https://github.com/myTerminal/theme-looper) for switching themes in style

### Key-bindings

Refer [config-key-bindings.el](.emacs.d/super-emacs/config-key-bindings.el) for all the pre-configured key-bindings for your convenience.

## Customizing

*super-emacs* comprises entirely of plain-text Elisp files. Not everyone has the same setup and that means that you can (and may) change these files according to your need. However, if you're the kind of person who regularly pulls updates from upstream, there's a high probability that future improvements may end up resulting in merge conflicts on your local workspace. In order to solve this problem (and according to a suggestion from [@ericllazarus](https://github.com/ericllazarus)), the arrangement now has a redesign providing the user a way to extend their configuration without causing conflicts with future updates. One recommended way of extending *super-emacs* is described below.

All configuration files under [.emacs.d/super-emacs](.emacs.d/super-emacs) with a name starting with `config-` can be extended by creating another file next to it with the same name but ending with a `-custom.el`. For example, if you plan to extend the file [config-packages.el](.emacs.d/super-emacs/config-packages.el), you can create a file with the name `config-packages-custom.el` next to it in order to hold custom configuration. *super-emacs* will load the original file first followed by the custom file (if it exists) in the right order as designed and you will achieve the effect you desire. Whenever there's an update to the original file, there will be no merge conflicts and life would be so much simpler!

## References

If you are looking for a light-weight configuration, try [ample-emacs](https://github.com/myTerminal/ample-emacs).

For an even more comprehensive configuration, refer to my [dotfiles](https://github.com/myTerminal/dotfiles).
