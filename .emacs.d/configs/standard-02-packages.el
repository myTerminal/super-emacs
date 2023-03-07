(defvar se2/packages-standard
  '(;; Text-editing
    (sublimity github "zk-phi/sublimity" t)
    ;; Color themes
    (theme-looper github "myTerminal/theme-looper" nil)
    (overcast-theme github "myTerminal/overcast-theme" nil)
    ;; Visual tweaks
    (powerline github "milkypostman/powerline" t)
    ))

(mapc 'se2/install-package-with-quelpa
      se2/packages-standard)

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
