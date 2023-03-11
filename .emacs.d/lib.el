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

(defun se2/bind-keys (bindings keymap)
  "Applies supplied key-bindings for a particular keymap"
  (mapc (lambda (b)
          (define-key keymap
            (kbd (car b))
            (cdr b)))
        bindings))

(defun se2/set-zoning ()
  "Sets zoning timeout"
  (interactive)
  (zone-when-idle 60)
  (message "Zoning set"))

(defun se2/change-line-endings-to-unix ()
  "Changes line-endings of current file to utf-8-unix."
  (interactive)
  (set-buffer-file-coding-system
   'utf-8-unix))

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

(defun se2/remove-formatting (text)
  "Removes formatting of the supplied text."
  (interactive "sEnter text: ")
  (kill-new text)
  (message "Formatting removed, text copied to clipboard!"))

(defun se2/switch-to-previous-buffer ()
  "Switch to most recent buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun se2/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun se2/reload-current-file ()
  "Reload the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

(defun se2/ask-for-password (password)
  "Prompts user for a password."
  (interactive "sEnter the password: ")
  password)

(defun se2/connect-to-irc (connection)
  "Connects to the supplied IRC server using an entered password."
  (let ((password (call-interactively 'se2/ask-for-password)))
    (funcall connection password)))

(defun se2/get-configured-irc-connections ()
  "Returns a collection of configured IRC connections in form of a hashmap."
  se2/variable/configured-irc-connections)

(defun se2/prompt-to-connect-to-irc ()
  "Prompts with a list of ERC connections and then connects to the chosen one."
  (interactive)
  (if (featurep 'ivy)
      (let* ((ivy-wrap t)
             (connections (se2/get-configured-irc-connections)))
        (ivy-read "Choose an IRC server: "
                  (hash-table-keys connections)
                  :action (lambda (server)
                            (let ((connection (gethash server connections)))
                              (if connection
                                  (se2/connect-to-irc connection)
                                (message "Please specify a valid server!"))))))))

;; Credit: https://github.com/jonathanj
(defun se2/window-toggle-split-direction ()
  "Switches window split from horizontally to vertically, or vice versa."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window
                                           neighbour-dir next-win)))))

          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir)
                                   other-buf))))))))
