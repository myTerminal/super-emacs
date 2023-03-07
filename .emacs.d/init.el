(require 'cl-lib)

;; Record startup timestamp
(defvar se2/invokation-time
  (current-time))

;; Initialize root
(defvar se2/se-root
  (file-name-directory load-file-name))

(defun se2/load-config (config-name)
  "Loads all the config files for the specified config."
  (mapc 'load (file-expand-wildcards (concat se2/se-root
                                             "configs/"
                                             config-name
                                             "-*.el"))))

(defun se2/start ()
  "Loads core and then conditionally loads configs."
  (load (expand-file-name "lib"
			              se2/se-root))
  (se2/load-config "basic")
  (if (display-graphic-p)
      (se2/load-config "standard"))
  (se2/print-startup-message))

;; Start
(se2/start)
