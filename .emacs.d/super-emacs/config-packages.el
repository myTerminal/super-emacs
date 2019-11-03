;;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;;Declare a list of required packages
(defvar se/configured-packages
  '(;;Text-editing
    multiple-cursors
    auto-complete
    undo-tree
    sublimity
    ;;Navigation
    ace-jump-mode
    ace-window
    buffer-move
    ;;File-system
    neotree
    ztree
    ;;Color themes
    theme-looper
    overcast-theme
    ;;Super-powers
    which-key
    counsel
    myterminal-controls
    ;;Visual tweaks
    powerline
    ;;Misc
    meta-presenter))

;;Install required packages
(mapc (lambda (p)
        (package-install p))
      se/configured-packages)

;;Load default auto-complete configs
(ac-config-default)

;;Start undo-tree
(global-undo-tree-mode)

;;Configure and enable sublimity-mode
(require 'sublimity-scroll)
(sublimity-mode)

;;Set up ace-jump-mode
(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-"
  t)

;;Configure theme-looper
(theme-looper-set-favorite-themes '(deeper-blue
				    wheatgrass
				    wombat
				    overcast))
(theme-looper-set-post-switch-script 'powerline-reset)

;;Start which-key-mode
(which-key-mode)

;;Start ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)

;;Configure myterminal-controls
(myterminal-controls-set-controls-data
 '(("." "Switch to next color-theme"
    theme-looper-enable-next-theme)
   ("," "Switch to previous color-theme"
    theme-looper-enable-previous-theme)
   ("r" "Reload file"
    super-emacs-reload-current-file
    t)))

;;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'slant)
