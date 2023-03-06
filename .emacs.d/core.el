;; Record startup timestamp
(defvar se/invokation-time
  (current-time))

;; Define base-path
(defvar se/base-path
  (file-name-directory load-file-name))

(defun se/load-file (file-path)
  "Loads the specified file relative to the base-path."
  (load (concat se/base-path
                file-path)))

;; Load lib.el
(se/load-file "lib")
