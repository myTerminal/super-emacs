;; Record startup timestamp
(defvar se2/invokation-time
  (current-time))

;; Define base-path
(defvar se2/base-path
  (file-name-directory load-file-name))

(defun se2/load-file (file-path)
  "Loads the specified file relative to the base-path."
  (load (concat se2/base-path
                file-path)))

;; Load lib.el
(se2/load-file "lib")
