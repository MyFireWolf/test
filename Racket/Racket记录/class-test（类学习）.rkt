#lang racket
(require racket/class)
(define (values . things)
  (call-with-current-continuation
   (lambda (cont) (apply cont things))))
;(define fish% (class object% (init size)(super-new)))
;(define charlie (new fish% [size 10])) 
(define myclass% 
  (class object%
    (init a b)
    (define aa a)
    (define bb b) 
    (super-new)
    ))
(new myclass% [a 20] [b 30])
(define inst-myclass (new myclass% [a 20] [b 30]))

 

