(define-module (gasket application)
  #:use-module (io path))

(define %gasket-path
  (expand-path (car (command-line))))


