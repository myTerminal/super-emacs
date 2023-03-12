;; System
(if (eq system-type
        'darwin)
    (progn
      (add-to-list 'exec-path
                   "/usr/local/bin")
      (add-to-list 'exec-path
                   "~/.cargo/bin")))

;; Backup
(setq backup-inhibited
      t)
(setq create-lockfiles
      nil)
(setq auto-save-default
      nil)

;; Startup
(setq inhibit-startup-screen
      t)
(setq initial-buffer-choice
      nil)
(setq initial-scratch-message
      "")

;; Interface
(menu-bar-mode -1)
(display-battery-mode)

;; Text editing
(column-number-mode)
(electric-pair-mode)
(show-paren-mode)
(global-hl-line-mode -1)
(setq-default indent-tabs-mode
              nil)
(setq-default tab-width
              4)
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
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))
(package-initialize)
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

;; Misc
(winner-mode t)
(windmove-default-keybindings)
(require 'zone)
(setq zone-programs
      [zone-pgm-quotes])
(setq org-todo-keywords
      '((sequence "DEFERRED(r)" "TODO(t)" "BLOCKED(b)" "IN-PROGRESS(p)" "|"
                  "ALMOST-THERE(a)" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)"))
      org-startup-indented t
      org-cycle-separator-lines 1)
(setq dired-listing-switches "-alh")
