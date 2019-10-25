;;Record startup timestamp
(defvar super-emacs/invokation-time
  (current-time))

;;Define base-path
(defvar super-emacs/base-path
  "~/.emacs.d/super-emacs/")

(defun super-emacs/load-config-file (file-path)
  "Loads the file at the specified file-path if it exists, else ignore"
  (load (concat super-emacs/base-path
                file-path))
  (load (concat super-emacs/base-path
                file-path
                "-custom")
        t))

(defun super-emacs/print-startup-message ()
  "Prints welcome message to the current buffer"
  (princ (concat "Welcome to super-emacs!"
                 "\n\n"
                 "Today is "
                 (format-time-string "%B %d %Y")
                 "\n\n"
                 "(Started in "
                 (number-to-string (cadr (time-subtract (current-time)
                                                        super-emacs/invokation-time)))
                 " seconds)")
         (get-buffer-create (current-buffer))))
