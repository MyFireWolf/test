#lang racket
;;;子进程运行exe文件 (subprocess #f #f #f #f "xxx.exe")

;;;运行python文件实例
(define-values (sp i o e) (subprocess #f #f #f
          "c:/pypy/pypy.exe"
          "c:/foo.py"))

(display "server\n" o)
(flush-output o)

(display (read-line i))
(display (read-line i))
(display (read-line i))
(display (read-line i))
(print "\nend...")

;;; TODO: 在此处添加进程实例代码