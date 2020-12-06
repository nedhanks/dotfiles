;;; org.el -*- lexical-binding: t; -*-

(use-package! org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

