(defun se/print-startup-message ()
  "Prints welcome message to the current buffer."
  (princ (concat "Welcome to super-emacs!"
                 "\n\n"
                 "Today is "
                 (format-time-string "%B %d %Y")
                 "\n\n"
                 "(Started in "
                 (number-to-string (cadr (time-subtract (current-time)
                                                        se/invokation-time)))
                 " seconds)")
         (get-buffer-create (current-buffer))))

(defun se/reload-current-file ()
  "Reload the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

(defun se/bind-keys (bindings keymap)
  "Applies supplied key-bindings for a particular keymap"
  (mapc (lambda (b)
          (define-key keymap
            (kbd (car b))
            (cdr b)))
        bindings))
