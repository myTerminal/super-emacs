;;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;;Declare a list of required packages
(defvar se/configured-packages
  '(counsel
    multiple-cursors
    ace-jump-mode
    ace-window
    sublimity
    powerline
    buffer-move
    auto-complete
    ztree
    undo-tree
    neotree
    which-key
    overcast-theme
    meta-presenter
    myterminal-controls
    theme-looper))

;;Install required packages
(mapc (lambda (p)
        (package-install p))
      se/configured-packages)

;;Configure and enable sublimity-mode
(require 'sublimity-scroll)
(sublimity-mode)

;;Load default auto-complete configs
(ac-config-default)

;;Start undo-tree
(global-undo-tree-mode)

;;Start which-key-mode
(which-key-mode)

;;Set up ace-jump-mode
(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-"
  t)

;;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'slant)

;;Configure theme-looper
(theme-looper-set-favorite-themes '(deeper-blue
				    wheatgrass
				    wombat
				    overcast))
(theme-looper-set-post-switch-script 'powerline-reset)

;;Configure myterminal-controls
(myterminal-controls-set-controls-data
 '(("." "Switch to next color-theme"
    theme-looper-enable-next-theme)
   ("," "Switch to previous color-theme"
    theme-looper-enable-previous-theme)
   ("r" "Reload file"
    super-emacs-reload-current-file
    t)))

;;Start ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)
