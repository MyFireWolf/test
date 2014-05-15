#lang racket
(require net/pop3)
(define c (connect-to-server "pop3.126.com"))
(authenticate/plain-text "yexiaoting...@126.com" "密码***" c)
(get-mailbox-status c)



#|
  python代码：

  import poplib
  p=poplib.POP3_SSL("pop.qq.com")
  p.user("5228*****@qq.com")
  p.pass_("密码******")
  print("connected...")
  p.getwelcome()

|#

;net/pop3模块不支持ssl，不确定

#|
  文档中的实例：

　11.2 Example Session

> (require net/pop3)
> (define c (connect-to-server "foo.bar.com"))
> (authenticate/plain-text "bob" "********" c)
> (get-mailbox-status c)
196
816400
> (get-message/headers c 100)
("Date: Thu, 6 Nov 1997 12:34:18 -0600 (CST)"
 "Message-Id: <199711061834.MAA11961@foo.bar.com>"
 "From: Alice <alice@foo.bar.com>"
 ....
 "Status: RO")
> (get-message/complete  c 100)
("Date: Thu, 6 Nov 1997 12:34:18 -0600 (CST)"
 "Message-Id: <199711061834.MAA11961@foo.bar.com>"
 "From: Alice <alice@foo.bar.com>"
 ....
 "Status: RO")
("some body" "text" "goes" "." "here" "." "")
> (get-unique-id/single c 205)
no message numbered 205 available for unique id
> (list-tail (get-unique-id/all c) 194)
((195 . "e24d13c7ef050000") (196 . "3ad2767070050000"))
> (get-unique-id/single c 196)
"3ad2767070050000"
> (disconnect-from-server c)

|#