#lang racket
;;; prefix-in 后加字符串：　导入了模块后就会在变量或函数前加上字符串
(require (prefix-in ab: "ab.rkt"))
ab:b
(ab:setb! 9)

           