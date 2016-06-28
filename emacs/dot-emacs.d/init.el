(add-to-list 'load-path "/Users/jvkersch/local/org/emacs/site-lisp/org")
(require 'org)
(org-babel-load-file
 (expand-file-name "emacs.org"
                   user-emacs-directory))
