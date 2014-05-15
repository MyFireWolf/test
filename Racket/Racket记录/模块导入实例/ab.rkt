#lang racket
(provide 变量a 变量b 设置变量b的值!)
(define 变量a "aaa")
(define 变量b 3)

(define (设置变量b的值! n)
  (set! 变量b n))
