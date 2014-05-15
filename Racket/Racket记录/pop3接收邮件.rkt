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