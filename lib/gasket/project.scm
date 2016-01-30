

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket project)
  #:use-module (oop goops))

;;;

(define-class <gasket-project> ()
  (name #:allocation #:instance
        #:init-keyword #:name )
  (version #:allocation #:instance
           #:init-keyword #:version)
  (dependencies #:allocation #:instance
                #:init-value '())
  (meta-info #:allocation #:instance
             #:init-value (make-hash-table)))

(define $project-state '(absent install-dep installed))

(define-method (object->string (self <gasket-project>))
  (slot-ref self 'name))

(define-method (update-from-meta-file (self <gasket-project>) (metafile <string>))
  )
