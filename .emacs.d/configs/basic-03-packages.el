(defvar se2/packages-basic
  '(;; Text-editing
    (multiple-cursors github "magnars/multiple-cursors.el" t)
    (company github "company-mode/company-mode" t)
    ;; Navigation
    (dumb-jump github "jacktasia/dumb-jump" t)
    (ace-jump-mode github "winterTTr/ace-jump-mode" t)
    (ace-window github "abo-abo/ace-window" t)
    (buffer-move github "lukhas/buffer-move" t)
    ;; Programming tools
    (projectile github "bbatsov/projectile" t)
    (counsel-projectile github "ericdanan/counsel-projectile" t)
    ;; File-system
    (ranger github "ralesi/ranger" t)
    (neotree github "jaypei/emacs-neotree" t)
    (ztree github "fourier/ztree" nil)
    ;; Super-powers
    (which-key github "justbur/emacs-which-key" t)
    (counsel github "abo-abo/swiper" t ("counsel.el"))
    (myterminal-controls github "myTerminal/myterminal-controls" t)
    ;; Statistical computing
    (ess github "emacs-ess/ESS" t ("*.el" "lisp/*.el"))
    (polymode github "polymode/polymode" t)
    (poly-R github "polymode/poly-R" t)
    (poly-markdown github "polymode/poly-markdown" t)
    ;; Misc
    (meta-presenter github "myTerminal/meta-presenter" t)
    ))

(mapc 'se2/install-package-with-quelpa
      se2/packages-basic)

;; Start company-mode globally
(add-hook 'after-init-hook
          'global-company-mode)

;; Enable dumb-jump
(dumb-jump-mode)

;; Set up ace-jump-mode
(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-"
  t)

;; Configure projectile and counsel-projectile
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

;; Start which-key-mode
(which-key-mode)

;; Start ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)
(setq projectile-completion-system
      'ivy)

;; Enable counsel-projectile
(counsel-projectile-mode)

;; Configure myterminal-controls
(myterminal-controls-set-controls-data
 '(("." "Switch to next color-theme"
    theme-looper-enable-next-theme)
   ("," "Switch to previous color-theme"
    theme-looper-enable-previous-theme)
   ("r" "Reload file"
    super-emacs-reload-current-file
    t)))
