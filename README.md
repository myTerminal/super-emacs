# super-emacs

![Banner](images/banner.png)

[![Docker Automated](https://img.shields.io/docker/automated/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Stars](https://img.shields.io/docker/stars/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Pulls](https://img.shields.io/docker/pulls/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Layers](https://images.microbadger.com/badges/image/myterminal/super-emacs.svg)](https://microbadger.com/images/myterminal/super-emacs)  
[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl.html)
[![Join the chat at https://gitter.im/myTerminal/super-emacs](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/myTerminal/super-emacs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

An out-of-the-box Emacs configuration with super-powers

## An old video demo

[![http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg](http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg)](http://www.youtube.com/watch?v=mRoGM_-8K9g)

## Setup

*super-emacs* can be used in two ways.

### GitHub

Getting it from GitHub is easier of the two methods. You just need to clone the repository on your local workspace like:

    git clone https://github.com/myTerminal/super-emacs.git

Then the only next step would be to make sure that [.emacs.d](.emacs.d) is at the root of your home directory.

You can either place it there manually or otherwise create a soft-link from its location to the home directory.

    ln -s </path/to/cloned/project>/super-emacs/.emacs.d ~/.emacs.d

A clear advantage of the above method would be that you can pull updates from upstream with almost no effort.

Once done, start Emacs to enjoy new super-powers.

### Docker Hub

*super-emacs* is also available on Docker. To start it, run a command that looks like:

    docker pull myterminal/super-emacs

## Features

### Highlights

- Minimal interface with almost everything except the window turned off
- [overcast-theme](http://github.com/myTerminal/overcast-theme) applied by default, with a readable font-size
- [MELPA](http://melpa.org) added as a package archive
- Easy IDE-like project interaction with [projectile](https://github.com/bbatsov/projectile) and [dumb-jump](https://github.com/jacktasia/dumb-jump)
- Opinionatedly better file-management with [ranger.el](https://github.com/ralesi/ranger.el)
- Smooth scrolling with [sublimity](https://github.com/zk-phi/sublimity)
- Spell-check with [ispell](https://www.emacswiki.org/emacs/InteractiveSpell) using an external spell checker [aspell](http://aspell.net)
- Navigation through buffers simplified with [winner](http://emacswiki.org/emacs/WinnerMode) and [windmove](http://emacswiki.org/emacs/WindMove).
- See command suggestions when `C-x` is pressed, using [which-key](https://github.com/justbur/emacs-which-key)
- Super-easy file system navigation with [neotree](https://github.com/jaypei/emacs-neotree)
- No more welcome screen, Emacs starts up to greet you and shows the date
- Reload file in a buffer quickly with `<f5>`
- Some more configuration to improve usability

### Pre-configured packages

- Text-editing
    - [multiple-cursors](https://github.com/magnars/multiple-cursors.el) to allow spawning of multiple cursors to editing text that follows a particular pattern
    - [auto-complete](https://github.com/auto-complete/auto-complete) to intelligently save key-strokes
    - [undo-tree](https://github.com/emacsmirror/undo-tree) to provide a means to move back to a particular point of time through a visual timeline of changes
    - [sublimity](https://github.com/zk-phi/sublimity) to be able to scroll buffers smoothly
- Navigation
    - [dumb-jump](https://github.com/jacktasia/dumb-jump) to provide a 'zero-configuration' setup for "jump-to-definition" to quickly jump to implementation of a particular function to see its implementation
    - [ace-jump-mode](https://github.com/winterTTr/ace-jump-mode) to be able to jump around in a buffer (and back) quickly
    - [ace-window](https://github.com/abo-abo/ace-window) to be able to switch windows visually with minimal key-presses
    - [buffer-move](http://www.emacswiki.org/emacs/buffer-move.el) for moving buffers within windows like a breeze
- Programming tools
    - [projectile](https://github.com/bbatsov/projectile) to be able to work with projects as you do in modern IDEs
- File-system
    - [ranger.el](https://github.com/ralesi/ranger.el) to bring a ranger-like file-manager to Emacs
    - [neotree](https://github.com/jaypei/emacs-neotree) to be able to spawn a tree at any directory
    - [ztree](https://github.com/fourier/ztree) for an efficient directory tree comparison
- Color themes
    - [theme-looper](https://github.com/myTerminal/theme-looper) for switching themes in style
    - [overcast-theme](https://github.com/myTerminal/overcast-theme) as a dark color theme
- Super-powers
    - [which-key](https://github.com/justbur/emacs-which-key) to provide instant help around key-bindings as you press keys
    - [ivy](https://github.com/abo-abo/swiper) (along with counsel and swiper) to make your experience with Emacs better
    - [counsel-projectile](https://github.com/ericdanan/counsel-projectile) to enable ivy integration for projectile
    - [myterminal-controls](https://github.com/myTerminal/myterminal-controls) for quick-toggle controls that can be spawned with a single key-stroke
- Visual tweaks
    - [powerline](https://github.com/milkypostman/powerline) to decorate your mode-line and add more information
- Miscellaneous
    - [meta-presenter](https://github.com/myTerminal/meta-presenter) for presenting slide-shows from within Emacs using markdown files

### Added key-bindings over stock Emacs

Refer [config-key-bindings.el](.emacs.d/super-emacs/config-key-bindings.el) for all the pre-configured key-bindings for your convenience.

### Optional external dependencies

####  [aspell](http://aspell.net) for spell-check

The presence of this package is detected for use with `ispell` for spell-check. Refer to [the official site](http://aspell.net) for instructions on how to install it on your operating system.

It could be as easy as

    # For Fedora
    dnf install aspell

OR

    # For macOS
    brew install aspell

depending upon your operating system.

## Customizing

*super-emacs* comprises entirely of plain-text Elisp files. Not everyone has the same setup and that means that you can (and may) change these files according to your need. However, if you're the kind of person who regularly pulls updates from upstream, there's a high probability that future improvements may end up resulting in merge conflicts on your local workspace. In order to solve this problem (and according to a suggestion from [@ericllazarus](https://github.com/ericllazarus)), the arrangement now has a redesign providing the user a way to extend their configuration without causing conflicts with future updates. One recommended way of extending *super-emacs* is described below.

All configuration files under [.emacs.d/super-emacs](.emacs.d/super-emacs) with a name starting with `config-` can be extended by creating another file next to it with the same name but ending with a `-custom.el`. For example, if you plan to extend the file [config-packages.el](.emacs.d/super-emacs/config-packages.el), you can create a file with the name `config-packages-custom.el` next to it in order to hold custom configuration. *super-emacs* will load the original file first followed by the custom file (if it exists) in the right order as designed and you will achieve the effect you desire. Whenever there's an update to the original file, there will be no merge conflicts and life would be so much simpler!

## More

If you're looking for a light-weight setup, try [ample-emacs](https://github.com/myTerminal/ample-emacs).

For an even more comprehensive setup, refer to [my personal configs](https://github.com/myTerminal/.emacs.d).
