(defvar se/config-root
  (file-name-directory load-file-name))
(load (expand-file-name "super-emacs/core"
			se/config-root))
(se/load-file "config-system")
(se/load-file "config-repositories")
(se/load-file "config-packages")
(se/load-file "config-interface")
(se/load-file "config-misc")
(se/load-file "config-key-bindings")
(se/print-startup-message)
