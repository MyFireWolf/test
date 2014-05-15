#lang racket
(struct a (x y))
(define aa (a 8 9))
(fprintf (current-output-port) "~a one\r\n1\r\n2\r\n" aa)

;;; 源码来源 cgi.rkt 
(define (string->html s)
  (apply string-append
         (map (lambda (c)
                (case c
                  [(#\<) "&lt;"]
                  [(#\>) "&gt;"]
                  [(#\&) "&amp;"]
                  [else (string c)]))
              (string->list s))))
;;;--------------------------------;;;

(string-append "a" "b")
;(string-append '("a" "b")) 将出错，解决方法如下：
(apply string-append '("a" "b"))
(apply string-append "a" '("b"))
(apply string-append "a" "b" '())
;;;注意 (apply string-append "a" "b") 报错 一定要有一个'()形式出现


;(map + '(1 2 3 4 5))
;(map + 1 2 3 4 5)
(apply + '(1 2 3 4 5))
;(apply + 1 2 3 4 5 '())

;;(eval '(+ 2 3)) 保存到文件命令行运行racket xxx.rkt出错，IDE下报错，
;;交互式方法不会报错
;;解决方法：
(eval #'(* 2 3))

(define (format-apply fmt . data)
  (apply format fmt data))

(format-apply "~a ~a test"  2 "3")