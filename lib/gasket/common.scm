(define-module (gasket common)
  #:use-module (gauche file util)
  #:use-module (shell command))

(define-public (find-meta-file dir-path)
  ""
  (let ((found-paths (map file-exists? (list (build-path dir-path "meta.info")
                                             (build-path dir-path "meta.json")))))
    (if (null? found-paths)
        (car found-paths)
        #f)))

(define-public (in-dir where what)
  ""
  (mkpath where)
  (let ((old-path (cwd)))
    (chdir where)
    (what where)
    (chdir old-path)))

(define-public (with-site-dir what)
  ""
  (let ((site-dir (%site-dir)))
    (what site-dir)))

(define-public (slurp filename)
  (call-with-input-file filename
    (lambda (input)
      (read input))))
