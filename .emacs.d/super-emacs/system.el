;;Set custom-file so that Emacs does not use init.el
(setq custom-file
      "~/.emacs.d/custom.el")

;;Stop Emacs from writing package information to init.el
(setq package--init-file-ensured
      t)