;;; roam.el -*- lexical-binding: t; -*-
;;;

(setq org-roam-tag-sources '(prop all-directories))

(after! org-roam
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-capture" "c" #'org-roam-capture))

(setq org-roam-capture-templates
      '(("d" "default" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "%<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: default\n#+CREATED:\n\n}"
         :unarrowed t)
        ("n" "notes" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "notes/%<%Y-%m>/%<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: notes\n#+CREATED: %u\n#+LAST_MODIFIED: %U\n\n"
         :unnarrowed t)
        ("e" "emacs" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "notes/%<%Y-%m>/%<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: emacs\n#+CREATED: %u\n#+LAST_MODIFIED: %U\n\n"
         :unnarrowed t)
        ("a" "AWS" plain (function org-roam-capture--get-point)
	 "%?"
         :file-name "aws/$<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: aws\n#+CREATED: %u\n#+LAST_MODIFIED: %U\n\n"
	 :unnarrowed t)
        ("p" "personal" plain (function org-roam-capture--get-point)
	 "%?"
         :file-name "aws/$<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: personal\n#+CREATED: %u\n#+LAST_MODIFIED: %U\n\n"
	 :unnarrowed t)
        ("f" "finances" plain (function org-roam-capture--get-point)
	 "%?"
         :file-name "aws/$<%Y%m%d>-${slug}"
         :head "#+TITLE: ${title}\n#+ROAM_TAGS: personal\n#+CREATED: %u\n#+LAST_MODIFIED: %U\n\n"
	 :unnarrowed t)
        ))

(setq org-roam-capture-ref-templates
      '(
        ("r" "ref" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "ref/%<%Y-%m>/%<%Y%m%d>-${slug}"
         :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_tags: \n#+created: %u\n#+last_modified: %U\n* URL: ${ref}"
         :unnarrowed t)
        ("a" "ref" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "aws/%<%Y-%m>/%<%Y%m%d>-${slug}"
         :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_tags: aws\n#+created: %u\n#+last_modified: %U\n* URL: ${ref}\n\n"
         :unnarrowed t)
        ))

(require 'company-org-roam)

(use-package! company-org-roam
  :when (featurep! :completion company)
  :after org-roam
  :config
  (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

(require 'org-roam-protocol)
