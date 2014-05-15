#lang racket
(define (test arg)
  (case-lambda
    [(tag)((test arg) tag #f)]
    [(tag tag2)((test arg) tag tag2 #f)]
    [(tag tag2 tag3) ((test arg) tag tag2 tag3 #f)]
    [(tag tag2 tag3 tag4)     
     (display tag)
     (display tag2)
     (display tag3)
     (display tag4)]))
((test #t) 1)
(display "\n******\n")
((test #t) 1 2)
(display "\n******\n")
((test #t) 1 2 3)
(display "\n******\n")
((test #t) 1 2 3 4)