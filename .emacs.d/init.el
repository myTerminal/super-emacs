(require 'cl-lib)

;; Initialize root
(defvar se2/config-root
  (file-name-directory load-file-name))

(defun se2/start ()
  "Loads core and then conditionally loads configs."
  (cl-flet* ((start-basic ()
                          (se2/load-file "configs/basic-misc")
                          (se2/load-file "configs/basic-packages")
                          (se2/load-file "configs/basic-key-bindings")
                          (se2/load-file "configs/basic-custom"))
             (start-standard ()
                             (se2/load-file "configs/standard-misc")
                             (se2/load-file "configs/standard-packages")
                             (se2/load-file "configs/standard-key-bindings")
                             (se2/load-file "configs/standard-custom")))
    (load (expand-file-name "core"
			                se2/config-root))
    (start-basic)
    (if (display-graphic-p)
        (start-standard))
    (se2/print-startup-message)))

;; Start
(se2/start)
