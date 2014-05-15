#lang racket
;;; 将fff.dll 文件复制到 C:\Program Files\Racket\lib文件夹下
;;; '(so "fff") 是重要 '(lib "fff")  '(module .... ....)
(require ffi/unsafe)
(require racket/runtime-path)
(define-runtime-path libssl-so
  (case (system-type)
    [(windows) '(so "fff")]
    [else '(so "libssl")]))
(define libssl (ffi-lib libssl-so))