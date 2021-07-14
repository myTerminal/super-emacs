;; Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;; Declare a list of required packages
(defvar se/configured-packages-standard
  '(;; Text-editing
    sublimity
    ;; Color themes
    theme-looper
    overcast-theme
    ;; Visual tweaks
    powerline))

;; Install required packages
(mapc (lambda (p)
        (package-install p))
      se/configured-packages-standard)

;; Configure and enable sublimity-mode
(require 'sublimity-scroll)
(sublimity-mode)

;; Configure theme-looper
(theme-looper-set-favorite-themes '(deeper-blue
				    wheatgrass
				    wombat
				    overcast))
(add-hook 'theme-looper-post-switch-hook
          'powerline-reset)

;; Set the default theme
(load-theme 'overcast
            t)

;; Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'slant)
