#lang racket
(require xml net/url)
(define (serve port-no)
  (define listener (tcp-listen port-no 5 #t))  
  (define (loop) 
    (accept-and-handle listener) 
    (loop))  
  (loop)) 

(define (accept-and-handle listener)  
  (define-values (in out) (tcp-accept listener)) 
  (display (read-line in))
  (handle in out)   
  (close-input-port in) 
  (close-output-port out)) 

(define (handle in out) 
  (regexp-match #rx"(\r\n|^)\r\n" in)   
  (display "HTTP/1.0 200 Okay\r\n" out)  
  (display "Server: k\r\nContent-Type: text/html\r\n\r\n" out)  
  (display (xexpr->string '(html  (head (title "Hello")) (body (a ((href "http://www.qq.com"))(p "qq"))))) out)) 

(serve 55555)
;;;(define html-string (xexpr->string '(html  (head (title "Hello")) (body (a ((href "http://www.qq.com"))(p "qq"))))))
;;;<html><head><title>Hello</title></head><body><a half="http://www.qq.com"><p>qq</p></a></body></html>




;;首先加载TCP协议模块
（require Scheme/tcp)

;;定义一个server的线程

(define server (thread (lambda ()
   (let ((thd (tcp-listen 8080)))
     (let loop ((ready (tcp-accept-ready? thd)))
       (if ready
         (let-values (((in out) (tcp-accept thd)))
(read in)
(close-input-port in)
(write 'got-it out)
(close-output-port out)
(loop (tcp-accept-ready? thd)))))))))

;;然后一个客户机

(define client (thread (lambda ()
    (let-values (((in out) (tcp-connect "localhost" 8080)))
       (write "hello" out)
       (close-output-port out)
       (read in)
       (close-input-port in)
      (kill-thread client)))))

