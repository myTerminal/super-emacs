(require 'cl-lib)

;; Initialize root
(defvar se2/config-root
  (file-name-directory load-file-name))

(defun se2/start ()
  "Loads core and then conditionally loads configs."
  (load (expand-file-name "core"
			              se2/config-root))
  (se2/load-config "basic")
  (if (display-graphic-p)
      (se2/load-config "standard"))
  (se2/print-startup-message))

;; Start
(se2/start)
