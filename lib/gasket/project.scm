

;;; 
;;; Commentary:
;;; 
;;; Code:

(define-module (gasket project)
  #:use-module (gasket common)
  #:use-module (oop goops)
  #:use-module (ice-9 hash-table))

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

(define %project-state
  '("absent" "install-dep" "installed"))

(define-method (instance->string (self <gasket-project>))
  (slot-ref self 'name))

(define-method (update-from-meta-file (self <gasket-project>) (metafile <string>))
  (let ((mod (slurp metafile)))
    (set-slot! self 'name         (assq-ref         mod 'name))
    (set-slot! self 'version      (assq-ref         mod 'version))
    (set-slot! self 'dependencies (assq-ref         mod 'depends))
    (set-slot! self 'meta-info    (alist-hash-table mod))))
