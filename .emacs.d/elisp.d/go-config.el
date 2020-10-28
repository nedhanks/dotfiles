;; Go language support
(use-package go-mode
	:defer t
	:ensure t
	:mode ("\\.go\\'" . go-mode)
	:init
	(setq compile-command "echo Building... && go build -v")
	(setq compilation-read-command nil)
	:bind
	(("M-," . compile)
   ("M-." . godef-jump)))

(setq compilation-window-height 14)

