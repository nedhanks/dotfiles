(setq inhibit-startup-message t)
(toggle-frame-maximized)

;; initialize package sources

(require 'package)

(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package counsel
    :defer t
    :config
    (counsel-mode 1))

(use-package ivy
    :config
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    (ivy-mode 1))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(server-start)

;; UI Personalization
	
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

(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)

(load-theme 'doom-palenight t)

(use-package emojify
	     :hook (erc-mode . emojify-mode)
	     :commands emojify-mode)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline emojify use-package spacemacs-theme spacegray-theme panda-theme overcast-theme monokai-theme material-theme lush-theme ivy idea-darkula-theme doom-themes command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
