

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket)
  #:use-module (gasket common)
  #:use-module (gasket project)
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

(define-method (announce (self <gasket>) (what))
  (format #t " ===> ~A~%" what))

(define-method (annouce-building (self <gasket>) (project <gasket-project>))
  (format #t " ===> building ~A~%" (get-name project)))

(define-method (annouce-installing (self <gasket>) (project <gasket-project>))
  (format #t " ===> installing ~A~%" (get-name project)))

(define-method (announce-success (self <gasket>) (project <gasket-project>))
  (format #t " ===> successfully installed ~A~%" (get-name project)))

(define-method (announce-depends (self <gasket>) (module-pair))
  (format #t " ===> ~A depends on ~A" (car module-pair) (cdr module-pair)))
