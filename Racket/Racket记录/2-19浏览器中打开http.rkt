#lang racket
;;;浏览器中打开http://......]
(shell-execute #f
                 "http://racket-lang.org"
                 "" 
                 (current-directory) 
                 'sw_shownormal) 
;;;调试函数
(require racket/trace)
(define (f x) (if (zero? x) 0 (add1 (f (sub1 x)))))  
(trace f) 
(f 10) 