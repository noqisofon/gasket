(define-module (shell command))

(define (cat-simple filename)
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
  ""
  (if (list? filenames)
      (for-each cat-simple filenames)
      (cat-simple filenames)))

(define (rm-f-simple filename)
  (if (file-exists? filename)
      (delete-file filename)))

(define-public (rm-f filenames)
  ""
  (if (list? filenames)
      (for-each rm-f-simple filenames)
      (rm-f-simple filenames)))
