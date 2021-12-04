(require 'cl-lib)

;; Initialize root
(defvar se/config-root
  (file-name-directory load-file-name))

(defun se/start ()
  "Loads core and then conditionally loads configs."
  (cl-flet* ((start-basic ()
                          (se/load-file "modes/basic/misc")
                          (se/load-file "modes/basic/packages")
                          (se/load-file "modes/basic/key-bindings"))
             (start-standard ()
                             (se/load-file "modes/standard/misc")
                             (se/load-file "modes/standard/packages")
                             (se/load-file "modes/standard/key-bindings")))
    (load (expand-file-name "core"
			                se/config-root))
    (start-basic)
    (if (display-graphic-p)
        (start-standard))
    (se/print-startup-message)))

;; Start
(se/start)
