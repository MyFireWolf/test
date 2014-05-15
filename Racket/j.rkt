#lang racket
(define-syntax (swap stx)
    (syntax-case stx ()
      [(_ a b)
       (syntax (let ([t a])
                   (set! a b)
                   (set! b t)))]))
(let ([x 5] [y 10])
    (swap x y)
    (list x y))

(define-syntax (swap1 stx)
    (syntax-case stx ()
      [(_ a b)
      ; #`(list #,#'a #,@(syntax-e #'b))
       
       #`(list #,#'a #,@#'(2 3 4 b)) ;  '(5 2 3 4 (7 10))
       ]))

(let ([x 5] [y '(7 10)])
   (swap1 x y))