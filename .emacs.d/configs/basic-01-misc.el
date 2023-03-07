;; System
(if (eq system-type
        'darwin)
    (add-to-list 'exec-path
                 "/usr/local/bin"))

;; Startup
(setq initial-buffer-choice
      t)
(setq initial-scratch-message
      "")

;; Interface
(menu-bar-mode -1)

;; Text editing
(column-number-mode)
(electric-pair-mode)
(show-paren-mode)
(global-hl-line-mode -1)
(setq-default indent-tabs-mode
              nil)
(set-default 'cursor-type
             'hbar)
(delete-selection-mode 1)
(setq kill-whole-line
      t)
(prefer-coding-system 'utf-8-unix)
(setq inhibit-eol-conversion t)
(global-auto-revert-mode 1)

;; Spell-check
(let ((path-to-aspell (locate-file "aspell"
                                   exec-path
                                   exec-suffixes
                                   1)))
  (unless (null path-to-aspell)
    (progn
      (add-to-list 'exec-path (file-name-directory path-to-aspell))
      (setq ispell-program-name "aspell")
      (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))))
(add-hook 'text-mode-hook
          'flyspell-mode)

;; Package archives and 'customize'
(setq custom-file
      (concat se2/se-root
              "custom.el"))
(require 'package)
(setq package-user-dir
      (concat se2/se-root
              "elpa"))
(setq package--init-file-ensured
      t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(package-initialize)
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

;; Misc
(winner-mode t)
(windmove-default-keybindings)
(setq org-startup-indented t
      org-cycle-separator-lines 1)
(setq dired-listing-switches "-alh")
