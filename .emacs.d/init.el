(require 'cl-lib)

;; Initialize root
(defvar se/config-root
  (file-name-directory load-file-name))

(defun se/start ()
  "Loads core and then conditionally loads configs."
  (cl-flet* ((start-basic ()
                          (se/load-file "basic/misc")
                          (se/load-file "basic/packages")
                          (se/load-file "basic/key-bindings"))
             (start-standard ()
                             (se/load-file "standard/misc")
                             (se/load-file "standard/packages")
                             (se/load-file "standard/key-bindings")))
    (load (expand-file-name "super-emacs/core"
			                se/config-root))
    (start-basic)
    (if (display-graphic-p)
        (start-standard))
    (se/print-startup-message)))

;; Start
(se/start)
