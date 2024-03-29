(setq frame-title-format "%b - super-emacs"
      use-dialog-box nil
      visible-bell t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-face-attribute 'mode-line
                    nil
                    :box nil)

(setq org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(640))

(if (find-font (font-spec :name se2/variable/font-default-family))
    (set-face-attribute 'default nil
                        :font se2/variable/font-default-family
                        :height se2/variable/font-default-height))

(set-frame-size (selected-frame)
                (car se2/variable/frame-dimensions)
                (cdr se2/variable/frame-dimensions))
