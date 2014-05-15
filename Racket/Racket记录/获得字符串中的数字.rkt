#! /usr/bin/env racket
#lang racket
#|
  NAME:
     getModelNumber.rkt
     This program is used to get model number based on the
     input model file name.
  USAGE:
     ./getModelNumber.rkt modelfilename
  EXAMPLE:
     ./getModelNumber.rkt gitst22.mat
  OUTPUT:
     22
|#

;; deal with the arguments
(define verbose? (make-parameter #f))
(define fileformat? (make-parameter #f))
(define argslist 
  (command-line
   #:usage-help
   "Get model number based on the filename."
   #:once-each        
   [("-v" "--verbose") "Verbose mode" (verbose? #t)]
   #:args
   (filename [format ".mat"]) (list filename format)))

;; define indicator
(define number -1)
(define filename (list-ref argslist 0))
(define format (list-ref argslist 1))

;; check the filename format is legal.
(if (regexp-match? (string-append format "$") filename)
    (fileformat? #t)
    (when (verbose?)
      (display "Filename must be end format of .mat \n")));

;; get the model number
(define getNumber
  (lambda (filename)
    (regexp-match #px"\\d+" filename)))

(when (and (getNumber filename)
           (fileformat?))
  (set! number
        (string->number (list-ref (getNumber filename) 0))))

number    ; return number value.
