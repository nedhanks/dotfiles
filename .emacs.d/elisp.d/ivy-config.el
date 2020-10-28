(use-package counsel
  :defer t
	:bind
	(("M-x"   . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r"  . 'counsel-minibuffer-history))
   :config
	 (setq ivy-initial-inputs-alist nil))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB"  . ivy-alt-done)
	 ("C-l"  . ivy-alt-done)
	 ("C-j"  . ivy-next-line)
	 ("C-k"  . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k"  . ivy-previous-line)
	 ("C-l"  . ivy-done)
	 ("C-d"  . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k"  . ivy-previous-line)
	 ("C-d"  . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  ;; use different regex per completion
  (push '(swiper . ivy--regex-ignore-order) ivy-re-builders-alist)
  (push '(counsel-M-x . ivy--regex-ignore-order) ivy-re-builders-alist)
  ;; minibuffer height
  (setf (alist-get 'counsel-projectile-ag ivy-height-alist) 15)
  (setf (alist-get 'counsel-projectile-rg ivy-height-alist) 15)
  (setf (alist-get 'swiper ivy-height-alist) 15)
  (setf (alist-get 'counsel-switch-buffer ivy-height-alist) 7))
  
