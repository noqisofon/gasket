(define-module (gasket application)
  #:use-module (gauche file util))

(define %gasket-path
  (expand-path (car (command-line))))


