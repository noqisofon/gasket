

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket)
  #:use-module (gasket common)
  #:use-module (gasket installer)
  #:use-module (gasket project)
  #:use-module (gauche file util)
  #:use-module (shell command)
  #:use-module (oop goops))

;;;

(define-class <gasket> ()
  ;; (fetcher #:allocation #:instance
  ;;          #:init-value (make <gasket-fetcher>)
  ;;          #:getter get-fetcher
  ;;          #:setter set-fetcher!)
  (installer #:allocation #:instance
             #:init-value (make <gasket-installer>)
             #:getter get-installer
             #:setter set-installer!))

(define-method (announce (self <gasket>) (what <string>))
  (format #t " ===> ~A~%" what))

(define-method (annouce-building (self <gasket>) (project <gasket-project>))
  (format #t " ===> building ~A~%" (slot-ref project 'name)))

(define-method (annouce-installing (self <gasket>) (project <gasket-project>))
  (format #t " ===> installing ~A~%" (slot-ref project 'name)))

(define-method (announce-success (self <gasket>) (project <gasket-project>))
  (format #t " ===> successfully installed ~A~%" (slot-ref project 'name)))

(define-method (announce-depends (self <gasket>) (module-pair <pair>))
  (format #t " ===> ~A depends on ~A" (car module-pair) (cdr module-pair)))

(define-method (project-from-local (self <gasket>) (project-name <string>))
  (let ((metafile (find-meta-file project-name)))
    #f))
