;;利用 socket 连接服务器   包括连接http 
;;(setq my-socket (ccl:make-socket
;;                 :address-family :internet
;;                 :type :stream
;;                 :connect :active                 
;;                 :format :text
;;                 :local-port 20000
;;                 :reuse-address t))


;;(setq a (ccl:make-socket :type :stream :connect :active :remote-host "www.qq.com" :remote-port 80))
;;(ccl:stream-write-string a "GET / HTTP/1.1
;;Connection:Close
;;
;;")
;;(finish-output a)
;;(ccl:stream-read-char a)

(defun httpconn (url port math)
  (let (
        (sock (ccl:make-socket :type :stream
                               :connect :active
                               :remote-host url
                               :remote-port port))
        )
    (ccl:stream-write-string sock math)
    (finish-output sock)
    (ccl:stream-read-char sock)

    )  
  )