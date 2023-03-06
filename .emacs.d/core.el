;; Record startup timestamp
(defvar se2/invokation-time
  (current-time))

;; Define base-path
(defvar se2/base-path
  (file-name-directory load-file-name))

(defun se2/load-config (config-name)
  "Loads all the config files for the specified config."
  (mapc 'load (file-expand-wildcards (concat se2/base-path
                                             "configs/"
                                             config-name
                                             "-*.el"))))

;; Load lib.el
(load (concat se2/base-path
              "lib"))
