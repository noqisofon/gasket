(define-module (shell command)
  #:use-module (file finder))

(define (file-is-regular? path)
  ""
  (if (file-exists? path)
      (let ((st (stat path)))
        (eq? 'regular (stat:type st)))
      ;; else
      #f))

(define (file-is-directory? path)
  ""
  (if (file-exists? path)
      (let ((st (stat path)))
        (eq? 'directory (stat:type st)))
      ;; else
      #f))

(define (*cat filename)
  ""
  (call-output-file filename
                    (lambda (port)
                      (lambda recur ((line (port-line port)))
                              (if (eof-object? line)
                                  #f
                                  (begin
                                    (display line)
                                    (recur (port-line port))))))))

(define-public (cat filenames)
  "specified file is concatenated and displayed"
  (if (list? filenames)
      (for-each *cat filenames)
      ;; else
      (*cat filenames)))

(define (*rm-f filename)
  ""
  (when (file-exists? filename)
        (delete-file filename)))

(define-public (rm-f filenames)
  "delete file or directory"
  (if (list? filenames)
      (for-each *rm-f filenames)
      ;; else
      (*rm-f filenames)))

(define (*rm-rf path)
  ""
  (if (file-is-directory? path)
      (rmdir path)
      ;; else
      (*rm-f path)))

(define-public (rm-rf filenames)
  (map (lambda (filename)
         (if (file-is-directory? filename)
             (map *rm-rf (file-find filename))
             ;; else
             (*rm-f filename)))
       filenames))

;; (define-public (cp from to recursive?)
;;   ""
;;   (if (file-is-directory? from)
;;       (begin
;;         (when (file-exists? )))
;;       ;; else
;;       ))
