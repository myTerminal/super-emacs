;; Initialize root
(defvar se/config-root
  (file-name-directory load-file-name))

(defun se/start-basic ()
  "Loads basic configs"
  (se/load-file "basic/misc")
  (se/load-file "basic/packages")
  (se/load-file "basic/key-bindings"))

(defun se/start-standard ()
  "Loads standard configs"
  (se/load-file "standard/misc")
  (se/load-file "standard/packages")
  (se/load-file "standard/key-bindings"))

(defun se/start ()
  "Loads core and then conditionally loads configs"
  (load (expand-file-name "super-emacs/core"
			              se/config-root))
  (se/start-basic)
  (if (display-graphic-p)
      (se/start-standard))
  (se/print-startup-message))

;; Start
(se/start)
