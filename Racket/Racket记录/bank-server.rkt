#lang racket
(module bank-server racket 
  (provide
   (contract-out
    [deposit 
     (-> (lambda (x) 
       (and (number? x) (integer? x) (>= x 0)))  
         any)])) 
  
  (define total 0)    
  (define (deposit a) (set! total (+ a total))))

#|
调用方法
(require "bank-server.rkt")
或者 (load "bank-server.rkt")(require 'bank-server)
(deposit -10) 
|#