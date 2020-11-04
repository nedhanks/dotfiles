;; startup performance
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))
;; load per system settings
(let ((per-system-settings (expand-file-name "per-system-settings.d/per-system-settings.el" user-emacs-directory)))
	(when (file-exists-p per-system-settings)
		(load-file per-system-settings)))

;; move cruft
(setq cruft-emacs-directory "~/.cache/emacs.d"
			backup-directory-alist `(("." . ,(expand-file-name "backups" cruft-emacs-directory)))
			url-history-file (expand-file-name "url/history" cruft-emacs-directory)
			auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" cruft-emacs-directory)
			projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" cruft-emacs-directory))

(setq custom-file
			(if (boundp 'server-socket-dir)
					(expand-file-name "custome.el" server-socket-dir)
				(expand-file-name (format "emacs-custom-%s.el" (user-uid)) cruft-emacs-directory)))
(load custom-file t)

;; add elisp to load-path
(let ((default-directory (expand-file-name "elisp.d/" user-emacs-directory)))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path))

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

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; ui
(load "ui-config")

;; ivy
(load "ivy-config")

;; programming languages
(load "lsp-config")

;; go
(load "go-config")

;; org-mode, org-roam, org-journal
(load "init-org")

;; restclient
(load "init-restclient")

(server-start)

(setq vc-follow-symlinks t)

;;(setq inhibit-startup-message t)
(toggle-frame-maximized)

