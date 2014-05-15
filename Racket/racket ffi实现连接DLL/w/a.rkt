#lang racket
(require ffi/unsafe 
         ffi/unsafe/define) 
(define-ffi-definer define-curses (ffi-lib "fff")) 
(define-curses func (_fun _int -> _int))
