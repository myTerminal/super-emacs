;;Startup
(setq initial-buffer-choice
      t)
(setq initial-scratch-message
      "")

;;Interface
(setq frame-title-format "%b - super-emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'overcast
            t)
(custom-set-faces
 '(default ((t (:height 120)))))

;;Text editing
(electric-pair-mode)
(show-paren-mode)
(global-hl-line-mode -1)
(setq-default indent-tabs-mode
              nil)
(set-default 'cursor-type
             'hbar)
(setq kill-whole-line
      t)
(prefer-coding-system 'utf-8-unix)

;;Package archives and 'customize'
(setq custom-file
      (concat se/config-root
              "custom.el"))
(require 'package)
(setq package-user-dir
      (concat se/config-root
              "elpa"))
(setq package--init-file-ensured
      t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
(package-initialize)

;;Misc
(winner-mode t)
(windmove-default-keybindings)
