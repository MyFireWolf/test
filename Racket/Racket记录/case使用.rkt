#lang racket
(define a "aaa")
(define b 3)

(case a
  [(b c) (values 3 4) ]
    [("aaa") (print "aaa")]
  [("aa")(print "aa")])