

;;; Commentary:
;;;
;;; Compile-time configuration of Gasket
;;;
;;; Code:


(define-module (gasket config)
  #:exports ())

;;;

(define-public %gasket-package-name
  "Gasket")

(define-public %gasket-version
  "0.1.0")

(define-public %gasket-bug-report-address
  "ned.rihine@gmail.com")

(define-public %gasket-home-page-url
  "https://github.com/noqisofon/gasket")

(define-public %temporary-directory
  (or (getenv "GASKET_TEMP_DIR")
      "/usr/local/var/gasket"))

(define-public %config-directory
  (or (getenv "GASKET_CONF_DIR")
      "/usr/local/etc/gasket"))

(define-public %machine-type
  "x86_64")

(define-public %gzip
  "/sbin/gzip")

(define-public %bzip2
  "/sbin/bzip2")

(define-public %xz
  "/sbin/xz")
