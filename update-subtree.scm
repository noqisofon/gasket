#!/usr/bin/guile \
-e main -s 
!#

(use-modules (srfi srfi-13))

(define %subtrees '(("./ext/io-path"       . "https://github.com:scheme-gasket/scm-io-path.git")
                    ("./ext/shell-command" . "https://github.com:scheme-gasket/scm-shell-command.git")
                    ("./ext/version"       . "https://github.com/scheme-gasket/scm-version.git")))

(define (update-one pair)
  (let ((prefix (car pair))
        (url    (cdr pair)))
    (system
     (string-join `("git" "subtree" "pull" "--prefix" ,prefix ,url "master" "--squash") " "))))

(define (main args)
  (map update-one %subtrees))
