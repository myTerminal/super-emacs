;; Record startup timestamp
(defvar se/invokation-time
  (current-time))

;; Define base-path
(defvar se/base-path
  (file-name-directory load-file-name))

(defun se/load-file (file-path)
  "Loads the specified file and also it's customized version, if it exists."
  (load (concat se/base-path
                file-path))
  (load (concat se/base-path
                file-path
                "-custom")
        t))

;; Load lib.el
(se/load-file "lib")
