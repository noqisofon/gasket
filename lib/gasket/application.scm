(define-module (gasket application)
  #:use-module (gauche file util))

(define gasket-path (expand-path (car (command-line))))

;; (define (regular-file? path)
;;   "ファイルのパスがレギュラーなエントリーであれば ~#t~ を返します。"
;;   (let ((st (stat path)))
;;     (stat:type st)))

;; (define (file-execute-access? path)
;;   ""
;;   (access? path X_OK))

;; (define (execution-file? path)
;;   "~#t~ will be returned if the path of a file can be performed. "
;;   (and (regular-file? path)
;;        (file-execute-access? path)))

(define-public (parse-version version)
  "Each number of a version character string is made into many values, and is returned."
  (let ((parts (string-split #\. version )))
    (apply values (map string->number
                       parts))))
