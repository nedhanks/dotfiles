;;; erc.el -*- lexical-binding: t; -*-


(defun ndh/erc-connect-freenode ()
  (interactive)
  (erc :server "irc.freenode.net"
       :port "6667"
       :nick "zamrog"
       :password "Kotlas11"
       :full-name "Ned D Hanks"))

(map! :leader
      :prefix "e"
      :desc "elc" "i" #'erc-select
      :desc "freenode" "f" #'ndh/erc-connect-freenode)

(after! erc
  (setq! erc-autojoin-timing `ident
         erc-autojoin-channels-alist '(("irc.freenode.net" "#emacs" "#erc" "#emacsconf"))
         erc-rename-buffers t
         erc-interpret-mirc-color t
         erc-default-server "irc.freenode.net"
         erc-nick "zamrog"
         erc-password "Kotlas11"
         erc-user-full-name "Ned D Hanks")
  (map! :leader
        :prefix "e"
        :desc "elc" "i" #'erc-select
        :desc "freenode" "f" #'ndh/erc-connect-freenode)
)
