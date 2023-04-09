(add-hook 'after-init-hook
          'global-company-mode)

(add-hook 'dired-mode-hook
          'auto-revert-mode)

(add-hook 'prog-mode-hook
          'display-line-numbers-mode)
(add-hook 'prog-mode-hook
          'electric-pair-local-mode)
(add-hook 'prog-mode-hook
          'outer-spaces-mode)

(add-hook 'text-mode-hook
          'electric-pair-local-mode)
(add-hook 'text-mode-hook
          'flyspell-mode)

(add-hook 'yas-minor-mode
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))
