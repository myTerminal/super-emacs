(defun se2/print-startup-message ()
  "Prints welcome message to the current buffer."
  (princ (concat "Welcome to super-emacs!"
                 "\n\n"
                 "Today is "
                 (format-time-string "%B %d %Y")
                 "\n\n"
                 "(Started in "
                 (number-to-string (cadr (time-subtract (current-time)
                                                        se2/invokation-time)))
                 " seconds)")
         (get-buffer-create (current-buffer))))

(defun se2/install-package-with-quelpa (p)
  "Installs the supplied package with quelpa, if not already installed"
  (unless (package-installed-p (car p))
    (cond ((eq (cadr p) 'melpa) (quelpa (car p)
                                        :stable (cadddr p)))
          ((eq (cadr p) 'github) (if (null (cadddr (cdr p)))
                                     (quelpa `(,(car p)
                                           :fetcher ,(cadr p)
                                           :repo ,(caddr p)
                                           :stable ,(cadddr p)))
                                   (quelpa `(,(car p)
                                           :fetcher ,(cadr p)
                                           :repo ,(caddr p)
                                           :files ,(cadddr (cdr p))
                                           :stable ,(cadddr p)))))
          (t (quelpa `(,(car p)
                       :fetcher ,(cadr p)
                       :url ,(caddr p)
                       :stable ,(cadddr p)))))))

(defun se2/reload-current-file ()
  "Reload the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

(defun se2/bind-keys (bindings keymap)
  "Applies supplied key-bindings for a particular keymap"
  (mapc (lambda (b)
          (define-key keymap
            (kbd (car b))
            (cdr b)))
        bindings))

(defun se2/move-line-up ()
  "Moves the current line up by one step."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun se2/move-line-down ()
  "Moves the current line down by one step."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun se2/delete-word-backward ()
  "Deletes the word on the left of the cursor."
  (interactive)
  (set-mark-command nil)
  (backward-word)
  (backward-delete-char-untabify 1))

(defun se2/eval-and-replace ()
  "Replaces expression to the left with it's value in the current buffer."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(defun se2/switch-to-previous-buffer ()
  "Switch to most recent buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun se2/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
