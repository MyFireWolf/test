#lang racket

(struct a (x y z))
(define a-struct (a 1 2 3))
(match-define (a xx yy _) a-struct)

;; > xx
;; 1
;; > yy
;; 2
