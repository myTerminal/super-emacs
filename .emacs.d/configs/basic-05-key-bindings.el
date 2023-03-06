(se2/bind-keys '(
                ;; Buffer/Window management
                ("C-x b" . ivy-switch-buffer)
                ("C-c p" . se2/switch-to-previous-buffer)
                ("C-x C-f" . counsel-find-file)
                ("C-x C-r" . counsel-recentf)
                ("C-S-<up>" . buf-move-up)
                ("C-S-<down>" . buf-move-down)
                ("C-S-<left>" . buf-move-left)
                ("C-S-<right>" . buf-move-right)
                ("C-;" . ace-window)
                ("C-x k" . se2/kill-this-buffer)
                ;; Text-editing
                ("C-}" . mc/mark-next-like-this)
                ("C-{" . mc/mark-previous-like-this)
                ("C-|" . mc/mark-all-like-this)
                ("M-y" . counsel-yank-pop)
                ("M-<down>" . se2/move-line-down)
                ("M-<up>" . se2/move-line-up)
                ("C-<backspace>" . se2/delete-word-backward)
                ("C-s" . swiper)
                ("<f5>" . se2/reload-current-file)
                ;; Navigation
                ("C->" . ace-jump-mode)
                ("C-<" . ace-jump-mode-pop-mark)
                ("C-\," . neotree-toggle)
                ("C-x p" . projectile-mode)
                ;; Misc
                ("C-=" . se2/eval-and-replace)
                ("C-c M-x" . execute-extended-command)
                ("M-x" . counsel-M-x)
                ("C-M-'" . myterminal-controls-open-controls))
               global-map)