;;; Add-on for Ellama

(defun ellama-omni-menu ()
  "Provide the user with all Ellama actions."
  (interactive)
  (let ((ellama-actions '(
                          ellama-code-complete
                          ellama-code-add
                          ellama-code-edit
                          ellama-code-improve
                          ellama-code-review
                          ellama-generate-commit-message
                          ellama-summarize
                          ellama-summarize-webpage
                          ellama-summarize-killring
                          ellama-load-session
                          ellama-session-rename
                          ellama-session-remove
                          ellama-session-switch
                          ellama-improve-wording
                          ellama-improve-grammar
                          ellama-improve-conciseness
                          ellama-make-list
                          ellama-make-table
                          ellama-make-format
                          ellama-ask-about
                          ellama-chat
                          ellama-ask-line
                          ellama-ask-selection
                          ellama-translate
                          ellama-translate-buffer
                          ellama-complete
                          ellama-chat-translation-enable
                          ellama-chat-translation-disable
                          ellama-define-word
                          ellama-context-add-buffer
                          ellama-context-add-file
                          ellama-context-add-selection
                          ellama-context-add-info-node
                          ellama-provider-select
                          )))
    (if (featurep 'ivy)
        (let ((ivy-wrap t))
          (ivy-read "Ellama: "
                    ellama-actions
                    :action (lambda (th)
                              (call-interactively (intern th)))))
      (call-interactively (intern (ido-completing-read "Ellama: "
                                                       (mapcar #'symbol-name
                                                               ellama-actions)))))))

;;; Hydras

(defhydra se2/hydra-toggles (:color pink)
  "
_l_ line-numbers:  %`display-line-numbers-mode
_SPC_ outer-spaces:  %`outer-spaces-mode
_w_ word-wrap:  %`visual-line-mode
_k_ super-kill:  %`kill-whole-line
_s_ line-spacing:  %`line-spacing

"
  ("l" display-line-numbers-mode nil)
  ("SPC" outer-spaces-mode nil)
  ("w" visual-line-mode nil)
  ("k" se2/toggle-super-kill nil)
  ("s" se2/toggle-line-spacing nil) ; TODO: Move to standard mode
  ("q" nil "Cancel"))

(defhydra se2/hydra-tools (:color blue)
  "Tools"
  ("z" se2/set-zoning "Enable zoning")
  ("x" zone-leave-me-alone "Disable zoning")
  ("." ztree-dir "ztree")
  ("/" term "Terminal")
  ("i" se2/prompt-to-connect-to-irc "Connect to IRC")
  ("l" ellama-omni-menu "Ellama...")
  ("?" ellama-chat "Chat with Ellama")
  ("q" nil "Cancel"))

(defhydra se2/hydra-editing (:color blue)
  "Editing"
  ;; Programming
  (">" dumb-jump-go "Go to definition")
  ("<" dumb-jump-back "Back from definition")
  ;; Jumping
  ("k" avy-goto-char-timer "Jump to char")
  ("j" avy-goto-word-1 "Jump to word")
  ("l" avy-goto-line "Jump to line")
  ("[" pop-global-mark "Go back")
  ;; Searching
  ("s" projectile-find-all-occurrences "Search for occurrences")
  ("r" projectile-find-all-references "Search for references")
  ;; Misc
  ("f" se2/reload-current-file "Reload file")
  ("q" nil "Cancel"))

(defhydra se2/hydra-windows ()
  "Buffers and Windows"
  ;; Moving
  ("S-<up>" windmove-up "^")
  ("S-<down>" windmove-down "v")
  ("S-<left>" windmove-left "<")
  ("S-<right>" windmove-right ">")
  ("M-<up>" buf-move-up "Move up")
  ("M-<down>" buf-move-down "Move down")
  ("M-<left>" buf-move-left "Move left")
  ("M-<right>" buf-move-right "Move right")
  ;; Jumping
  ("\\" ace-window "Jump to window" :color blue)
  ;; Arranging
  ("_" window-shaper-mode "Resize windows" :color blue)
  ("+" se2/window-toggle-split-direction "Horizontal<>Vertical")
  ;; Misc
  ("q" nil "Cancel"))

;;; Key-chords

(key-chord-define-global "~~" 'se2/hydra-toggles/body)
(key-chord-define-global "[[" 'se2/hydra-tools/body)
(key-chord-define-global "]]" 'se2/hydra-editing/body)
(key-chord-define-global "\\\\" 'se2/hydra-windows/body)

;;; Regular key-bindings

(se2/bind-keys '(
                 ;; Buffer/Window management
                 ("C-x b" . ivy-switch-buffer)
                 ("C-c p" . se2/switch-to-previous-buffer)
                 ("C-c b" . ivy-push-view)
                 ("C-x C-f" . counsel-find-file)
                 ("C-x C-r" . counsel-recentf)
                 ("C-x k" . se2/kill-this-buffer)
                 ;; Text-editing
                 ("C-|" . undo-tree-visualize)
                 ("M-%" . anzu-query-replace)
                 ("C-}" . mc/mark-next-like-this)
                 ("C-{" . mc/mark-previous-like-this)
                 ("C-\"" . mc/mark-all-like-this)
                 ("M-y" . counsel-yank-pop)
                 ("M-<down>" . se2/move-line-down)
                 ("M-<up>" . se2/move-line-up)
                 ("C-<backspace>" . se2/delete-word-backward)
                 ("C-c s" . swiper)
                 ;; Misc
                 ("C-=" . se2/eval-and-replace)
                 ("M-x" . counsel-M-x))
               global-map)

(se2/bind-keys '(
                 ;; dired-narrow
                 ("/" . dired-narrow-fuzzy)
                 ;; dired-subtree
                 ("]" . dired-subtree-toggle)
                 ("[" . dired-subtree-cycle)
                 ("C-<up>" . dired-subtree-beginning)
                 ("C-<down>" . dired-subtree-end)
                 ("C-<left>" . dired-subtree-up)
                 ("C-<right>" . dired-subtree-down)
                 ("M-<up>" . dired-subtree-previous-sibling)
                 ("M-<down>" . dired-subtree-next-sibling)
                 ("M-<right>" . dired-subtree-mark-subtree)
                 ("M-<left>" . dired-subtree-unmark-subtree)
                 ;; dired-ranger
                 ("M-c" . dired-ranger-copy)
                 ("M-m" . dired-ranger-move)
                 ("M-v" . dired-ranger-paste))
               dired-mode-map)

(se2/bind-keys '(
                 ;; quickrun
                 ("C-c e" . quickrun)
                 ("C-c r" . quickrun-region)
                 ("C-c t" . quickrun-replace-region))
               prog-mode-map)

;;; Augmentations to company-mode
;; TODO: Find a better way to do this
(add-hook 'company-mode-hook
          (lambda ()
            (define-key company-active-map
              (kbd "RET")
              'company-abort)
            (define-key company-active-map
              [return]
              'company-abort)
            (define-key company-active-map
              (kbd "<right>")
              'company-complete-selection)))
