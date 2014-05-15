#lang racket
 (letrec ([odd (lambda (x) 
                  (if (zero? x) 
                      #f         
                      (even (sub1 x))))]   
           [even (lambda (x)  
                   (if (zero? x)  
                       #t             
                       (odd (sub1 x))))])  
    (odd 40000000))