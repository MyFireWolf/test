#lang racket

(let-syntax
    ((foo (syntax-rules ()
        ((foo (proc args ...) body ...)
         (define proc
           (lambda (args ...)
             body ...))))))
  (let ((x 3))
    (foo (plus x y c) (+ x y))
    (define foo x)
    (plus foo x 9)))
(call-with-current-continuation
 (lambda (exit)
   (for-each (lambda (x)
      (if (negative? x)
          (exit x)))
             ’(54 0 37 -3 245 19)) #t)) 
(define list-length
  (lambda (obj)
    (call-with-current-continuation
     (lambda (return)
       (letrec ((r (lambda (obj)
                   (cond ((null? obj) 0)
                         ((pair? obj)
                          (+ (r (cdr obj)) 1))
                         (else (return #f))))))
(r obj))))))
(list-length ’(1 2 3 4)) 
(list-length ’(a b . c))