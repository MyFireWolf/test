
(setq my-socket (ccl:make-socket
                 :address-family :internet
                 :type :stream
                 :connect :active                 
                 :format :text
                 :local-port 20000
                 :reuse-address t))

