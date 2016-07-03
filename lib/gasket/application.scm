

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket application)
  #:use-module (io path))

;;;

(define-public %gasket-path
  (expand-path (car (command-line))))


