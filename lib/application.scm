
;; (use-modules (file util))

(define gasket-path (expand-path (car (command-line))))

(define (regular-file? path)
  "ファイルのパスがレギュラーなエントリーであれば ~#t~ を返します。"
  (let ((st (stat path)))
    (stat:type st)))

(define (file-execute-access? path)
  (access? path X_OK))

(define (execution-file? path)
  "ファイルのパスが実行可能であれば ~#t~ を返します。"
  (and (regular-file? path)
       (file-execute-access? path)))

(define (parse-version version)
  "バージョン文字列のそれぞれの数字を多値にして返します。"
  (let ((part (string-split #\. version )))
    (apply values (map string->number
                       parts))))

(define (format-version version)
  "~version~ をバージョン文字列に変換します。"
  (string-join version #\.))

(define (get-gasket-path kind)
  ""
  )

(define (main args)
  (let ((argc (length (args))))
    (display args)
    (newline)))

(main (command-line))
