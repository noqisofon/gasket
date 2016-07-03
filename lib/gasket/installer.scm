

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket installer)
  #:use-module (gasket common)
  #:use-module (gasket project)
  #:use-module (shell command)
  ;;#:use-module (file finder)
  #:use-module (oop goops))

;;;

(define-class <gasket-installer> ()
  (prefix #:allocation #:instance
          #:init-keyword #:prefix))


(export <gasket-installer>)

;; (define-method (install (self <gasket-installer>) (from <string>) (to <string>) (project <gasket-project>) (force? <bool>))
;;   (unless to
;;           (set! to (get-prefix self)))
;;   (if (absolute-path? to)
;;       (set! to (abspath to)))
;;   (in-dir from
;;           (lambda ()
;;             )
;;           ))
