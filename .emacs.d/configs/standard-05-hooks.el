(add-hook 'dired-mode-hook
          'diff-hl-dired-mode)

(add-hook 'prog-mode-hook
          'fira-code-mode)
(add-hook 'prog-mode-hook
          'diff-hl-flydiff-mode)
(add-hook 'prog-mode-hook
          'diff-hl-show-hunk-mouse-mode)

(add-hook 'text-mode-hook
          'diff-hl-flydiff-mode)
(add-hook 'text-mode-hook
          'diff-hl-show-hunk-mouse-mode)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq buffer-face-mode-face `(:family ,se2/variable/font-family-for-programming))
            (buffer-face-mode)))
