;;���� socket ���ӷ�����   ��������http 
;;(setq my-socket (ccl:make-socket
;;                 :address-family :internet
;;                 :type :stream
;;                 :connect :active                 
;;                 :format :text
;;                 :local-port 20000
;;                 :reuse-address t))


;;(setq a (ccl:make-socket :type :stream :connect :active :remote-host "www.qq.com" :remote-port 80))
;;(ccl:stream-write-string a "GET / HTTP/1.1
;;Host:www.qq.com
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

(defmacro ������� (������ ֵ)
  `(setq ,������ ,ֵ) 
  )




(defmacro �������1 (&rest ������ֵ)
  `(setq ,@������ֵ) 
  )

(defmacro ���庯�� (������ ���� &rest ����)
  `(defun ,������ ,����
       ,@����
       )
  )


(defmacro aaa (a b)
  `(progn
     (defun aa () (print ))
     (print ,a)
     (print ,b)
     )
  )

(defmacro myfun (funname args &rest body)
     `(defun ,funname ,args
       ,@body
       )     
  )