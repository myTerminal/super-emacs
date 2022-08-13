# super-emacs

![Banner](images/banner.png)

[![Docker Automated](https://img.shields.io/docker/automated/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Stars](https://img.shields.io/docker/stars/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)
[![Docker Pulls](https://img.shields.io/docker/pulls/myterminal/super-emacs.svg)](https://hub.docker.com/r/myterminal/super-emacs)  
[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl.html)
[![Join the chat at https://gitter.im/myTerminal/super-emacs](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/myTerminal/super-emacs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

An out-of-the-box Emacs configuration with super-powers

## An old video demo

[![http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg](http://img.youtube.com/vi/mRoGM_-8K9g/0.jpg)](http://www.youtube.com/watch?v=mRoGM_-8K9g)

## Setup

*super-emacs* can be used in two ways.

### GitHub

Getting it from GitHub is the easier of the two methods. You just need to clone the repository on your local workspace like:

    git clone https://github.com/myTerminal/super-emacs.git

Then the only next step would be to make sure that [.emacs.d](.emacs.d) is at the root of your home directory.

You can either place it there manually or otherwise create a soft link from its location to the home directory.

    ln -s </path/to/cloned/project>/super-emacs/.emacs.d ~/.emacs.d

A clear advantage of the above method would be that you can pull updates from upstream with almost no effort.

Once done, start Emacs to enjoy new superpowers.

#### XDG support in Emacs 27+

Emacs 27 [comes with XDG support](https://git.savannah.gnu.org/cgit/emacs.git/commit/?id=4118297ae2fab4886b20d193ba511a229637aea3) and hence will also work with `~/.config/emacs`. To be able to use *super-emacs* that way (which may as well be the only way soon), you can link it in the following way:

    ln -s </path/to/cloned/project>/super-emacs/.emacs.d ~/.config/emacs


### Docker Hub

*super-emacs* is also available on Docker. To start it, run a command that looks like this:

    docker pull myterminal/super-emacs

## Features

### Highlights

- Minimal interface with almost everything except the window turned off
- [overcast-theme](http://github.com/myTerminal/overcast-theme) applied by default, with a readable font-size
- [MELPA](http://melpa.org) added as a package archive and package management using [quelpa](https://github.com/quelpa/quelpa) instead of [package.el](https://github.com/technomancy/package.el) for reliable versioning of packages
- Easy IDE-like project interaction with [projectile](https://github.com/bbatsov/projectile) and [dumb-jump](https://github.com/jacktasia/dumb-jump)
- Opinionatedly better file-management with [ranger.el](https://github.com/ralesi/ranger.el)
- Smooth scrolling with [sublimity](https://github.com/zk-phi/sublimity)
- Spell-check with [ispell](https://www.emacswiki.org/emacs/InteractiveSpell) using an external spell checker [aspell](http://aspell.net)
- Navigation through buffers simplified with [winner](http://emacswiki.org/emacs/WinnerMode) and [windmove](http://emacswiki.org/emacs/WindMove).
- See command suggestions when `C-x` is pressed, using [which-key](https://github.com/justbur/emacs-which-key)
- Super-easy file system navigation with [neotree](https://github.com/jaypei/emacs-neotree)
- No more welcome screen, Emacs starts up to greet you and shows the date
- Reload file in a buffer quickly with `<f5>`
- Statistical computing with [R Markdown](https://rmarkdown.rstudio.com) files through [ESS](https://github.com/emacs-ess/ESS) and [polymode](https://github.com/polymode/polymode)
- Some more configurations to improve the usability
- Adaptive behavior between graphical and non-graphical mode

### Pre-configured packages

- Text-editing
    - [multiple-cursors](https://github.com/magnars/multiple-cursors.el) to allow spawning of multiple cursors to editing text that follows a particular pattern
    - [company](https://github.com/company-mode/company-mode) for auto-completion
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
    - [ESS](https://github.com/emacs-ess/ESS), [polymode](https://github.com/polymode/polymode), [poly-R](https://github.com/polymode/poly-R) and [poly-markdown](https://github.com/polymode/poly-markdown) for statistical computing with [R Markdown](https://rmarkdown.rstudio.com) files.

### Added key-bindings over stock Emacs

Refer [basic/key-bindings.el](.emacs.d/modes/basic/key-bindings.el) and [standard/key-bindings.el](.emacs.d/modes/standard/key-bindings.el) for all the pre-configured key-bindings for your convenience.

### Optional external dependencies

####  [aspell](http://aspell.net) for spell-check

The presence of this package is detected for use with `ispell` for spell-check. Refer to [the official site](http://aspell.net) for instructions on how to install it on your operating system.

It could be as easy as

    # For Debian/Ubuntu
    apt install aspell

OR

    # For Fedora
    dnf install aspell

OR

    # For Arch Linux
    pacman -S aspell

OR

    # For macOS
    brew install aspell

depending upon your operating system.

#### [R](https://www.r-project.org) for statistical computing

To be able to work with R Markdown files, *super-emacs* comes pre-configured with all the required packages except for an external dependency on [R](https://www.r-project.org) which needs to be installed on the system.

## Customizing

Not everyone has the same setup and that means that you can (and may) change the configuration files according to your need. However, if you plan to clone this project, use it for your Emacs through a soft-link and pull updates from upstream regularly, there's a high probability that future improvements may end up resulting in merge conflicts on your local workspace. To solve this problem (and according to a suggestion from [@ericllazarus](https://github.com/ericllazarus)), *super-emacs* has been redesigned in a way that it now enables the user to extend their configuration without causing conflicts with future updates. One recommended way of extending *super-emacs* is described below.

All configuration files under [.emacs.d/modes/basic](.emacs.d/modes/basic) and [.emacs.d/modes/standard](.emacs.d/modes/standard) can be extended through contents in their neigboring `*-custom.el` file. For example, if you plan to extend the file [basic/packages.el](.emacs.d/modes/basic/packages.el), you can place your personal configuration in the file [basic/packages-custom.el](.emacs.d/modes/basic/packages-custom.el). *super-emacs* will load the files in the right order so that your custom configurations will override the ones from *super-emacs*. This way, whenever there's an update to the original file, there will be no merge conflicts and life would be so much simpler!

## More

If you're looking for a light-weight setup, try [ample-emacs](https://github.com/myTerminal/ample-emacs).

For an even more comprehensive setup, refer to [my personal configs](https://github.com/myTerminal/.emacs.d).
