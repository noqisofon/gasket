
(define-module (gasket config)
  #:exports ())

;;; Commentary:
;;;
;;; Compile-time configuration of Gasket
;;;
;;; Code:

(define %gasket-package-name
  "Gasket")

(define %gasket-version
  "0.1.0")

(define %gasket-bug-report-address
  "ned.rihine@gmail.com")

(define %gasket-home-page-url
  "https://github.com/noqisofon/gasket")

(define %temporary-directory
  (or (getenv "GASKET_TEMP_DIR")
      "/usr/local/var/gasket"))

(define %config-directory
  (or (getenv "GASKET_CONF_DIR")
      "/usr/local/etc/gasket"))

(define %machine-type
  "x86_64")

(define %gzip
  "/sbin/gzip")

(define %bzip2
  "/sbin/bzip2")

(define %xz
  "/sbin/xz")
