;;Change title-bar text
(setq frame-title-format
      "super-emacs")

;;Disable menu-bar
(menu-bar-mode -1)

;;Disable tool-bar
(tool-bar-mode -1)

;;Disable scroll-bar
(scroll-bar-mode -1)

;;Activate overcast theme
(load-theme 'overcast
            t)

;;Set font
(custom-set-faces
 '(default ((t (:height 120)))))
