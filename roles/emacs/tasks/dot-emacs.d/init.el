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
 '(package-selected-packages
   '(groovy-mode consult-org-roam org-roam emacsql-sqlite-builtin ace-window citar ox-json org-export-json nov geiser lsp-julia ess lua-mode quarto-mode yaml-mode snakemake-mode ivy use-package undo-tree stan-mode rustic request python-docstring python-black org-roam-ui org-journal org-download org-bullets matlab-mode magit lsp-mode julia-repl julia-mode hungry-delete hcl-mode flycheck fish-mode exec-path-from-shell elpy dockerfile-mode deft cython-mode color-theme-sanityinc-tomorrow bm avy auctex ace-isearch))
 '(warning-suppress-types '(((python python-shell-completion-native-turn-on-maybe)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
