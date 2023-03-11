(defvar se2/variable/color-theme
  'overcast)

(defvar se2/variable/font-default
  "-outline-Liberation Mono-normal-normal-normal-mono-20-*-*-*-c-*-iso8859-1")
(defvar se2/variable/font-family-for-programming
  "Fira Code")

;; TODO: Improve this, turn it into a simpler form
(defvar se2/variable/frame-dimensions
  '(100 . 30))

(defvar se2/variable/configured-irc-connections
  #s(hash-table
     size 3
     test equal
     data (
           "LiberaChat" (lambda (password)
                          (erc-tls :server "irc.libera.chat"
                                   :port 6697
                                   :nick "shepard"
                                   :full-name "Commander Shepard"
                                   :password password))
           "Freenode" (lambda (password)
                        (erc-tls :server "irc.freenode.net"
                                 :port 6697
                                 :nick "shepard"
                                 :full-name "Commander Shepard"
                                 :password password)))))
