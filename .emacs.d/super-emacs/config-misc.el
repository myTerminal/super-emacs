;;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice
      t)
(setq initial-scratch-message
      "")

;;Delete lines along with carriage returns
(setq kill-whole-line
      t)

;;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode
              nil)

;;Enable show-paren-mode
(show-paren-mode)

;;Enable winner-mode
(winner-mode t)

;;Enable windmove
(windmove-default-keybindings)
