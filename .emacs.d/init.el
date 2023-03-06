(require 'cl-lib)

;; Initialize root
(defvar se/config-root
  (file-name-directory load-file-name))

(defun se/start ()
  "Loads core and then conditionally loads configs."
  (cl-flet* ((start-basic ()
                          (se/load-file "configs/basic-misc")
                          (se/load-file "configs/basic-packages")
                          (se/load-file "configs/basic-key-bindings")
                          (se/load-file "configs/basic-custom"))
             (start-standard ()
                             (se/load-file "configs/standard-misc")
                             (se/load-file "configs/standard-packages")
                             (se/load-file "configs/standard-key-bindings")
                             (se/load-file "configs/standard-custom")))
    (load (expand-file-name "core"
			                se/config-root))
    (start-basic)
    (if (display-graphic-p)
        (start-standard))
    (se/print-startup-message)))

;; Start
(se/start)
