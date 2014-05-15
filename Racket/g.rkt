#lang racket
;#lang scribble/base
(require ffi/unsafe 
         ffi/unsafe/define) 
(define-ffi-definer define-curses (ffi-lib "fff")) 
(define-curses func (_fun -> _void))
(void (func))
(read)
(apply - 0 '(1 2 3 4))
(define (trace-wrap)  
    (make-keyword-procedure  
     (lambda (kws kw-args . rest)  
       (printf "Called with ~s ~s ~s\n" kws kw-args rest)
       )))     
((trace-wrap) "John" #:hi "Howdy" "a" #:name "myname" ) 
;> Called with (#:hi #:name) ("Howdy" "myname") ("John" "a")

;;; funtest运行出错， 需要 make-keyword-procedure处理实参,#:name字典
(define (funtest kws kw-args . rest)  
       (printf "Called with ~s ~s ~s\n" kws kw-args rest)
       )
;(funtest "John" #:hi "Howdy" "a" #:name "myname" ) 
;(require slideshow)