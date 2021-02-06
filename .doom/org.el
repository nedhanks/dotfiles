;;; org.el -*- lexical-binding: t; -*-

(setq! org-agenda-files '("~/Dropbox/org/agenda"))

(setq! org-refile-targets '((org-agenda-files :maxlevel . 3)))

(setq! org-enforce-todo-dependencies t)
(setq! org-track-ordered-property-with-tag t)
(setq! org-agenda-dim-blocked-tasks t)
(setq! org-enforce-todo-checkbox-dependencies t)

(setq! org-hugo-delete-trailing-ws t)
