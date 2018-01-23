;;Record startup timestamp
(defvar super-emacs/invokation-time
  (current-time))

;;Load configuration files
(load-file "~/.emacs.d/super-emacs/00-system.el")
(load-file "~/.emacs.d/super-emacs/01-repositories.el")
(load-file "~/.emacs.d/super-emacs/02-packages.el")
(load-file "~/.emacs.d/super-emacs/03-interface.el")
(load-file "~/.emacs.d/super-emacs/04-misc.el")
(load-file "~/.emacs.d/super-emacs/05-key-bindings.el")

;;Print welcome message
(princ (cl-concatenate 'string
                       "Startup completed in "
                       (number-to-string (cadr (time-subtract (current-time)
                                                              super-emacs/invokation-time)))
                       " seconds\n\n"
                       "Welcome to super-emacs!\n\n"
                       "Today's date: "
                       (format-time-string "%B %d %Y"))
       (get-buffer-create (current-buffer)))
