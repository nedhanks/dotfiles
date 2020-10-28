;; UI Personalization
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Menlo" :height 170)
	
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                erc-mode-hook
                term-mode-hook
                eshell-mode-hook
                vterm-mode-hook
                neotree-mode-hook
                telega-chat-mode-hook
                telega-root-mode-hook
                telega-webpage-mode-hook
                dashboard-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package emojify
	     :hook (erc-mode . emojify-mode)
	     :commands emojify-mode)

(use-package minions
  :hook (doom-modeline-mode . minions-mode)
  :custom
  (minions-mode-line-lighter ""))
  
(use-package doom-modeline
  :after eshell
  :hook (after-init . doom-modeline-init)
  :custom-face
  (mode-line ((t (:height 0.85))))
  (mode-line-inactive ((t (:height 0.85))))
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 15)
  (doom-modeline-lsp t)
  (doom-modeline-buffer-file-name-style 'truncate-except-project))

(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)

(load-theme 'doom-palenight t)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(setq-default tab-width 2)


