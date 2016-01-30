(define-module (file util))

(define* (home-directory #:optional user)
  "The home directory of user~user~ given by the user ID of the name or the integer is returned.
A current user is used when ~user~ is omitted.
~#f~ is returned, when the given user is not found or a home directory is not able to be determined."
  (let ((home-dir (getenv "HOME")))
    (if home-dir
        home-dir
        ;; else
        (passwd:dir (getpwuid (getuid))))))


(define-public (regular-file? path)
  "~#t~ will be returned if the path of a file is a regular entry."
  (let ((st (stat path)))
    (stat:type st)))

(define-public (file-execute-access? path)
  ""
  (access? path X_OK))

(define-public (execution-file? path)
  "~#t~ will be returned if the path of a file can be performed."
  (and (regular-file? path)
       (file-execute-access? path)))

(define* (build-path base-path #:rest components)
  "The ~component~ of a pathname is added to ~base-path~ ."
  (string-join (map (lambda (path)
                      (string-trim-both path (string-ref file-name-separator-string 0)))
                    (cons base-path components))
               file-name-separator-string
               'prefix))
(export build-path)

(define-public (expand-path path)
  "If ~path~ includes the tilde display, what developed it will be returned.
Otherwise, ~path~ itself is returned.
~path~ exists and whether it can access or not does not check this procedure. "
  (if (string-prefix? "~" path)
      (let ((home-dir (home-directory)))
        (string-append home-dir (string-drop path 1)))
      path))

