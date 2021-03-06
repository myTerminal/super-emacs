(defvar se/config-root
  (file-name-directory load-file-name))
(load (expand-file-name "super-emacs/core"
			se/config-root))
(se/load-file "standard/misc")
(se/load-file "standard/packages")
(se/load-file "standard/key-bindings")
(se/print-startup-message)
