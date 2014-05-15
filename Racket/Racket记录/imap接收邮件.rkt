#lang racket
(require net/imap)


#|  ；python代码：
    ；import imaplib
    ；s=imaplib.IMAP4_SSL("imap.qq.com")
    ；s.login("522828368@qq.com","*****")
    ；s.list()
    ；s.select("inbox")


;(set! debug-via-stdio? #t)
|#

(define-values (r w) (tcp-connect "imap.qq.com" 143))
(imap-connect* r w "522828368@qq.com" "*****" "inbox" #:tls? #t #:try-tls? #t)

;(define ima (make-imap r w #f #f #f #f #f (new-tree) (new-tree) #f))
;(imap-send imap "NOOP" void)

#|
 为解决imap.qq.com服务器端口为993，
 imap-port-number默认为143

 > imap-port-number
 #<procedure:parameter-procedure>
 > (imap-port-number)
 143
 > (imap-port-number 933)
 > (imap-port-number)
 933
|#

(imap-port-number 993)
(define-values (current-imap a b)(imap-connect "imap.qq.com" "522828368@qq.com" "密码******" "inbox" 
              #:tls? #t
              ;#:try-tls? #t         
              ))
(imap-poll current-imap)