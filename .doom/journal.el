;;; journal.el -*- lexical-binding: t; -*-

(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
    (pcase org-journal-file-type
      (`daily "#+TITLE: Daily Journal\n")
      (`weekly "#+TITLE: Weekly Journal\n")
      (`monthly "#+TITLE: Monthly Journal\n")
      (`yearly "#+TITLE: Yearly Journal\n"))))

(use-package! org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-dir "~/org-roam/journal")
  (org-journal-file-type `weekly)
  (org-journal-file-header 'org-journal-file-header-func)
  (org-journal-start-on-weekday 1)
  (org-journal-file-format "%Y-%m/%F-%V.org"))

(setq org-journal-enable-agenda-integration t)

(map! :leader
      (:prefix ("n j" . "journal")
       :desc "Create new journal entry" "j" #'org-journal-new-entry
       :desc "Open previous entry" "p" #'org-journal-previous-entry
       :desc "Open next entry" "n" #'org-journal-open-next-entry
       :desc "Search Journal" "s" #'org-journal-search-forever))
