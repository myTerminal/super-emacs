(defvar se/my-keyboard-bindings-standard
  '(;;Misc
    ("C-)" . theme-looper-enable-next-theme)
    ("C-(" . theme-looper-enable-previous-theme)))

(mapc 'se/assign-function-to-keys
      se/my-keyboard-bindings-standard)
