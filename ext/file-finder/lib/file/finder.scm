(define-module (file finder)
  #:use-module (ice-9 optargs))

(define (in-dir dirpath proc)
  (let ((targets (opendir dirpath)))
    (let recur ((entry (readdir targets)))
      (if (eof-object? entry)
          #f
          ;; else
          (begin
            (proc entry)
            (recur (readdir targets)))))
    (closedir targets)))

(define*-public (file-find dirpath
                    #:optional (exclude #f) (recursive? #t) (keep-going? #f)
                    #:key (name "") (type ""))
  )
