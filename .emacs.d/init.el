;;Record startup timestamp
(defvar super-emacs/invokation-time
  (current-time))

;;Load configuration files
(load-file "~/.emacs.d/super-emacs/system.el")
(load-file "~/.emacs.d/super-emacs/repositories.el")
(load-file "~/.emacs.d/super-emacs/packages.el")
(load-file "~/.emacs.d/super-emacs/interface.el")
(load-file "~/.emacs.d/super-emacs/misc.el")
(load-file "~/.emacs.d/super-emacs/key-bindings.el")

;;Print welcome message
(princ (concat "Welcome to super-emacs!"
               "\n\n"
               "Today is "
               (format-time-string "%B %d %Y")
               "\n\n"
               "(Started in "
               (number-to-string (cadr (time-subtract (current-time)
                                                      super-emacs/invokation-time)))
               " seconds)")
       (get-buffer-create (current-buffer)))
