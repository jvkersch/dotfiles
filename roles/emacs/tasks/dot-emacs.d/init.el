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
   '(2048-game ace-isearch ace-window auctex avy bm citar
               color-theme-sanityinc-tomorrow consult-org-roam
               cython-mode deft dockerfile-mode elpy
               emacsql-sqlite-builtin ess exec-path-from-shell
               fish-mode flycheck geiser gptel groovy-mode hcl-mode
               hungry-delete ivy julia-mode julia-repl lsp-julia
               lsp-mode lua-mode magit matlab-mode mixed-pitch neotree
               nov org-bullets org-download org-export-json
               org-journal org-roam org-roam-ui ox-json python-black
               python-docstring quarto-mode request rustic
               snakemake-mode stan-mode time-zones undo-tree
               use-package yaml-mode))
 '(package-vc-selected-packages
   '((time-zones :url "https://github.com/xenodium/time-zones")))
 '(warning-suppress-types '(((python python-shell-completion-native-turn-on-maybe)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#FFFFFF" :foreground "#37474F" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Roboto Mono")))))
