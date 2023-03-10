(defvar se2/packages-standard
  '(;; Language modes
    (latex-preview-pane github "jsinglet/latex-preview-pane" nil)
    ;; Programming tools
    (diff-hl github "dgutov/diff-hl" t)
    (skewer-mode github "skeeto/skewer-mode" t)
    ;; Color themes
    (material-theme github "cpaulik/emacs-material-theme" t)
    (hemisu-theme github "andrzejsliwa/hemisu-theme" nil)
    (green-phosphor-theme github "aalpern/emacs-color-theme-green-phosphor" nil)
    (overcast-theme github "myTerminal/overcast-theme" nil)
    ;; Visual tweaks
    (telephone-line github "dbordak/telephone-line" nil)
    (fira-code-mode github "jming422/fira-code-mode" nil)
    (theme-looper github "myTerminal/theme-looper" nil)
    ))

(mapc 'se2/install-package-with-quelpa
      se2/packages-standard)

(global-diff-hl-mode)

(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-hud-segment
                   telephone-line-position-segment))
        (accent . (telephone-line-buffer-modified-segment
                   telephone-line-buffer-name-segment
                   telephone-line-perspective-segment))
        (nil    . (telephone-line-minor-mode-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-process-segment
                   telephone-line-projectile-segment
                   telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-atom-eol-segment
                   telephone-line-atom-encoding-segment
                   telephone-line-filesize-segment))))
(setq telephone-line-primary-left-separator
      telephone-line-gradient)
(setq telephone-line-primary-right-separator
      telephone-line-gradient)
(telephone-line-mode t)

(theme-looper-enable-theme se2/variable/color-theme)
