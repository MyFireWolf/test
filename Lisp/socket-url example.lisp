
(setq my-socket (ccl:make-socket
                 :address-family :internet
                 :type :stream
                 :connect :active                 
                 :format :text
                 :local-port 20000
                 :reuse-address t))





(setq a (ccl:make-socket :type :stream :connect :active :remote-host "170.135.130.174" :remote-port 80))
(ccl:stream-write-string a "GET / HTTP/1.1
Connection:Close

")
(finish-output a)
(ccl:stream-read-char a)