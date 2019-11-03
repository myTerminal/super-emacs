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
    dumb-jump
    ace-jump-mode
    ace-window
    buffer-move
    ;;Programming tools
    projectile
    ;;File-system
    ranger
    neotree
    ztree
    ;;Color themes
    theme-looper
    overcast-theme
    ;;Super-powers
    which-key
    counsel
    counsel-projectile
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

;;Enable dumb-jump
(dumb-jump-mode)

;;Set up ace-jump-mode
(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-"
  t)

;;Configure projectile and counsel-projectile
(if (eq system-type
          'windows-nt)
      (setq projectile-indexing-method
            'alien))
  (setq projectile-switch-project-action
        (lambda ()
          (cond ((and (fboundp 'neo-global--window-exists-p)
                      (neo-global--window-exists-p))
                 (neotree-projectile-action))
                (t (counsel-projectile)))))
  (setq projectile-mode-line
        '(:eval (format " Project:%s"
                        (projectile-project-name))))
  (projectile-mode)
  (define-key projectile-mode-map
              (kbd "C-c C-p")
              'projectile-command-map)

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
(setq projectile-completion-system
      'ivy)

;;Enable counsel-projectile
(counsel-projectile-mode)

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
