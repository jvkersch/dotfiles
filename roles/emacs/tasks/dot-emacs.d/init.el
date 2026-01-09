;(package-initialize)

(setenv "PATH" (concat "/Library/TeX/texbin:"
                       (getenv "PATH")))
(add-to-list 'exec-path "/Library/TeX/texbin")

(require 'org)
(org-babel-load-file
  (file-truename
   (expand-file-name "emacs.org"
                      user-emacs-directory)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("7e98dc1aa7f5db0557691da690c38d55e83ddd33c6d268205d66e430d57fb982"
     "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
     default))
 '(org-agenda-files
   '("/Users/jvkersch/Dropbox/org-documents/journal/2021-08-30.org"
     "/Users/jvkersch/Dropbox/org-documents/journal/2021-09-07.org"
     "/Users/jvkersch/Dropbox/org-documents/journal/2021-09-22.org"
     "/Users/jvkersch/Dropbox/org-documents/journal/2021-10-15.org"
     "/Users/jvkersch/Dropbox/org-documents/journal/2021-10-19.org"
     "/Users/jvkersch/Dropbox/org-documents/journal/2021-12-02.org"
     "/Users/jvkersch/Dropbox/org-documents/meetings/group-meetings.org"
     "/Users/jvkersch/Dropbox/org-documents/projects/esther-park.org"
     "/Users/jvkersch/Dropbox/org-documents/projects/pytorch-16s.org"
     "/Users/jvkersch/Dropbox/org-documents/projects/weekly-meeting.org"
     "/Users/jvkersch/Dropbox/org-documents/belgium-trips.org"
     "/Users/jvkersch/Dropbox/org-documents/beluxcham.org"
     "/Users/jvkersch/Dropbox/org-documents/definite-no.org"
     "/Users/jvkersch/Dropbox/org-documents/deliverables.org"
     "/Users/jvkersch/Dropbox/org-documents/external-validation.org"
     "/Users/jvkersch/Dropbox/org-documents/foo.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-bkbf.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-2025-01.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-2025-02.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-2025-03.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-dec.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-exec-meeting-notes.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-nov.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-sept-oct.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-PA-tech-meeting-notes.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting-august.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-consulting.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd-professional.org"
     "/Users/jvkersch/Dropbox/org-documents/gtd.org"
     "/Users/jvkersch/Dropbox/org-documents/ideas-for-talks.org"
     "/Users/jvkersch/Dropbox/org-documents/inbox.org"
     "/Users/jvkersch/Dropbox/org-documents/makgeolli.org"
     "/Users/jvkersch/Dropbox/org-documents/reading-list.org"
     "/Users/jvkersch/Dropbox/org-documents/recurring.org"
     "/Users/jvkersch/Dropbox/org-documents/research-ideas.org"
     "/Users/jvkersch/Dropbox/org-documents/research-old.org"
     "/Users/jvkersch/Dropbox/org-documents/someday-maybe.org"
     "/Users/jvkersch/Dropbox/org-documents/statistics.org"
     "/Users/jvkersch/Dropbox/org-documents/tickler.org"
     "/Users/jvkersch/Dropbox/org-documents/todo-done.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2024-08-01-behavioral-quantification/main.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-02-01-new-master/suggestions.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-05-01-mansi-teaching/main.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-05-01-mansi-teaching/meeting-notes.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-08-07-wetlab-safety-training/main.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-09-11-BA1-threshold-conditions/documentation.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-09-19-zoe-cruyft-thesis/planning.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-09-19-zoe-cruyft-thesis/proposal.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-09-30-magda-resignation/notes.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-10-17-best-of-benelux/organization.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-10-20-talk-at-gmu/outline.org"
     "/Users/jvkersch/src/jvkersch/memex/01-projects/2025-11-15-kazakhstan-uzbekistan/trip.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/belgium/trip-winter-2025.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/board-of-directors/meetings.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/director-of-studies/projects.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/education/educational-quality.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/education/regulations.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/education/withdrawal-rules.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/korea-life/faculty-apartment.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/meetings/campus-council.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/meetings/intercampus-council.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/mentoring/solha.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/programme-committee/meetings.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/programme-committee/projects.org"
     "/Users/jvkersch/src/jvkersch/memex/02-areas/teaching.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/visas-for-researchers/main.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/computer.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/flying-faculty.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/miccai.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/project-management-course.org"
     "/Users/jvkersch/src/jvkersch/memex/03-resources/regulations.org"
     "/Users/jvkersch/src/jvkersch/memex/init.org"))
 '(package-selected-packages
   '(2048-game ace-isearch ace-window adaptive-wrap auctex avy bm citar
               color-theme-sanityinc-tomorrow consult consult-org-roam
               cython-mode deft dockerfile-mode elpy
               emacsql-sqlite-builtin embark-consult ess
               exec-path-from-shell fish-mode flycheck geiser gptel
               groovy-mode hcl-mode hungry-delete imenu-list ivy
               julia-mode julia-repl lsp-julia lsp-mode lua-mode magit
               marginalia matlab-mode mixed-pitch modus-themes neotree
               nov org-bullets org-download org-export-json
               org-journal org-modern org-roam org-roam-ui ox-json
               python-black python-docstring quarto-mode request
               ripgrep rustic snakemake-mode stan-mode svg-tag-mode
               time-zones undo-tree use-package vertico yaml-mode))
 '(package-vc-selected-packages
   '((time-zones :url "https://github.com/xenodium/time-zones")))
 '(safe-local-variable-values '((org-image-actual-width . t)))
 '(warning-suppress-types '(((python python-shell-completion-native-turn-on-maybe)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
