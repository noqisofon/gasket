(import (srfi srfi-9))


(define-record-type <command>
  name
  options
  defaults
  program-name
  summary)
