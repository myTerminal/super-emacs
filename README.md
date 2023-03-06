# super-emacs

![Banner](images/banner.png)

[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl.html)
[![Join the chat at https://gitter.im/myTerminal/super-emacs](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/myTerminal/super-emacs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)  
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y5E5GL7)

An out-of-the-box Emacs configuration with superpowers.

## Setup

Clone this project on your local workspace like:

    git clone https://github.com/myTerminal/super-emacs.git

Create a soft link to [.emacs.d](.emacs.d) under the user's home directory.

    ln -s </path/to/cloned/project>/super-emacs/.emacs.d ~/.emacs.d

If your file system does not support soft links for operating systems like Windows, you may create a copy of [.emacs.d](.emacs.d) under your home directory. An obvious problem with this method would be that updates to *super-emacs* would need much more than a `git pull`.

Once done, start Emacs to enjoy new superpowers. The first startup will take a little while to fetch packages from their respective sources.

#### XDG support in Emacs 27+

Emacs 27 [comes with XDG support](https://git.savannah.gnu.org/cgit/emacs.git/commit/?id=4118297ae2fab4886b20d193ba511a229637aea3) and hence will also work with `~/.config/emacs`. To be able to use *super-emacs* that way, you can link it in the following way:

    ln -s </path/to/cloned/project>/super-emacs/.emacs.d ~/.config/emacs

## Features

(coming soon)

## Key bindings

(coming soon)

## Optional external dependencies

###  [aspell](http://aspell.net) for spell-check

For spell-check, you need to have aspell installed on the system for it to work with `ispell`. Refer to [the official site](http://aspell.net) for instructions on how to install it on your operating system.

### [R](https://www.r-project.org) for statistical computing

To be able to work with R Markdown files, *super-emacs* comes pre-configured with all the required packages except for an external dependency on [R](https://www.r-project.org) which needs to be installed on the system.

## Customizing

The recommended way to customize *super-emacs* is to place your custom configuration scripts under [.emacs.d/configs/basic-custom.el](.emacs.d/configs/basic-custom.el) and [.emacs.d/configs/standard-custom.el](.emacs.d/configs/standard-custom.el) for text and graphical modes respectively. Configuration files will be loaded in the correct order so that your custom configuration will override the ones from *super-emacs*. This way, whenever there's an update to the original file, there will be no merge conflicts and life would be so much simpler!

## More

If you're looking for a lightweight setup, try [ample-emacs](https://github.com/myTerminal/ample-emacs).

For an even more comprehensive setup, refer to [my personal configs](https://github.com/myTerminal/.emacs.d).
