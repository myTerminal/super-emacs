(defvar se/my-keyboard-bindings-basic
  '(;; Buffer/Window management
    ("C-x b" . ivy-switch-buffer)
    ("C-x C-f" . counsel-find-file)
    ("C-x C-r" . counsel-recentf)
    ("C-S-<up>" . buf-move-up)
    ("C-S-<down>" . buf-move-down)
    ("C-S-<left>" . buf-move-left)
    ("C-S-<right>" . buf-move-right)
    ("C-;" . ace-window)
    ;; Text-editing
    ("C-}" . mc/mark-next-like-this)
    ("C-{" . mc/mark-previous-like-this)
    ("C-|" . mc/mark-all-like-this)
    ("M-y" . counsel-yank-pop)
    ("M-/" . undo-tree-visualize)
    ("C-s" . swiper)
    ("<f5>" . se/reload-current-file)
    ;; Navigation
    ("C->" . ace-jump-mode)
    ("C-<" . ace-jump-mode-pop-mark)
    ("C-\," . neotree-toggle)
    ("C-x p" . projectile-mode)
    ;; Misc
    ("C-c M-x" . execute-extended-command)
    ("M-x" . counsel-M-x)
    ("C-M-'" . myterminal-controls-open-controls)))

(mapc 'se/assign-function-to-keys
      se/my-keyboard-bindings-basic)
