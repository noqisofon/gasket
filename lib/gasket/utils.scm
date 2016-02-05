(define-module (gasket utils))



(define-public (parse-version version)
  (let ((parts (string-split #\. version)))
    (map string-number parts)))

(define-public (version-compare left-version right-version)
  (let* ((diff   (remove zero? (map -
                                    (parse-version left-version)
                                    (parse-version right-version))))
         (result (car diff)))
    (if (null? result)
        '=
        (cond ((positive? result)        '>)
              ((negative? result)        '<)
              (else                      '=)))))

(define-public (version>? left right)
  ""
  (eq? '> (version-compare left right)))

(define-public (version>=? left right)
  ""
  (case (version-compare left right)
    ((> =)                              #t)
    (else                               #f)))
