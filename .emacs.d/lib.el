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

(defun se/move-line-up ()
  "Moves the current line up by one step."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun se/move-line-down ()
  "Moves the current line down by one step."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun se/delete-word-backward ()
  "Deletes the word on the left of the cursor."
  (interactive)
  (set-mark-command nil)
  (backward-word)
  (backward-delete-char-untabify 1))

(defun se/eval-and-replace ()
  "Replaces expression to the left with it's value in the current buffer."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(defun se/switch-to-previous-buffer ()
  "Switch to most recent buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun se/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
