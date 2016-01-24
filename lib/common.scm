(define-module (gasket common)
  #:use-module (shell command))

(define-public (find-meta-file dir-path)
  ""
  (let ((found-paths (map file-exists? (list (string-append dir-path "/meta.info")
                                             (string-append dir-path "/meta.json")))))
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
