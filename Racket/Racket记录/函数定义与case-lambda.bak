#lang racket
(define tt
    (case-lambda
      [(socket) (print 1)]
      [(socket port-numbers?) 
        (print 2)]))
(tt 3) 
(printf "\n***\n")
(tt 4 5)
(printf "\n***\n")
(define-values (ttt)
    (case-lambda
      [(socket) (values 1 1)]
      [(socket port-numbers?) 
        (values 22 22)]))

(ttt 3)
(printf "\n***\n")
(ttt 4 5)

(define (a n?)
  (case-lambda
    [(name)((a n?) name #f)]
    [(name types)((a n?) name types #f)]
    [(name types isy?)
     (print name)
     (print types)
     (print isy?)]))
((a #f) "y")
((a #f) "y" "n")