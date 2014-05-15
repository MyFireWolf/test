#lang racket
;类似 python协程写法
(require racket/generator)
(define g (generator ()    
       (let loop ([x '(a b c)]) 
         (if (null? x)              
             0           
             (begin      
               (yield (car x)) 
               (loop (cdr x)))))))
(g) (g) (g)(g)(g)
;向协程传入一个参数
(define pass-values-generator 
  (generator ()   
    (let* ([from-user (yield 2)] 
      [from-user-again (yield (add1 from-user))]) 
      (yield from-user-again))))  
(pass-values-generator)    ; 显示结果2
(pass-values-generator 5)  ; 显示结果6
(pass-values-generator 12) ; 显示结果12  

#|
(define my-generator 
  (generator ()
             (yield 1)
             (yield 2 3 4)))
> (my-generator) 1
> (my-generator) 2 3 4   
(define pass-values-generator 
  (generator ()   
    (let* ([from-user (yield 2)] 
      [from-user-again (yield (add1 from-user))]) 
      (yield from-user-again))))  
> (pass-values-generator) 2
> (pass-values-generator 5) 6
> (pass-values-generator 12) 12  

(define welcome 
  (infinite-generator
   (yield 'hello) 
   (yield 'goodbye))) 

> (welcome) 'hello
> (welcome) 'goodbye 
> (welcome) 'hello 
> (welcome) 'goodbye  

(for/list ([i (in-generator  
               (let loop ([x '(a b c)])  
                 (when (not (null? x)) 
                   (yield (car x))
                   (loop (cdr x)))))]) 
  i) 
>'(a b c)  


> (let ([g (in-generator 
            (let loop ([n 3])   
              (unless (zero? n)
                (yield n (add1 n))
                (loop (sub1 n)))))]) 
    (let-values ([(not-empty? next) (sequence-generate g)]) 
      (let loop () (when (not-empty?) (next) (loop))) 'done))
stop?: arity mismatch; 
the expected number of arguments does not match the given number 
expected: 1   
given: 2  
arguments...:
3  
4 
> (let ([g (in-generator #:arity 2  
             (let loop ([n 3])  
               (unless (zero? n) 
                 (yield n (add1 n)) 
                 (loop (sub1 n)))))]) 
    (let-values ([(not-empty? next)
                  (sequence-generate g)])  
      (let loop () (when (not-empty?) (next) (loop))) 'done))
'done  

To use an existing generator as a sequence,
use in-producer with a stop-value known for the generator:

> (define abc-generator
    (generator ()
      (for ([x '(a b c)])
        (yield x)))) 
> (for/list ([i (in-producer abc-generator (void))])
    i) 
'(a b c) 
> (define my-stop-value (gensym)) 
> (define my-generator (generator () 
                         (let loop ([x (list 'a (void) 'c)]) 
                           (if (null? x)       
                               my-stop-value
                               (begin   
                                 (yield (car x)) 
                                 (loop (cdr x)))))))
> (for/list ([i (in-producer my-generator my-stop-value)])
    i) 
'(a #<void> c) 

procedure
(generator-state g) → symbol?
 
  g : generator? 

Returns a symbol that describes the state of the generator.

•'fresh — The generator has been freshly created and has not been called yet.

•'suspended — Control within the generator has been suspended due to a call to yield. The generator can be called.

•'running — The generator is currently executing.

•'done — The generator has executed its entire body and will continue to produce the same result as from the last call.


Examples:
> (define my-generator
    (generator () (yield 1) (yield 2))) 
> (generator-state my-generator) 'fresh 
> (my-generator) 1
> (generator-state my-generator) 'suspended
> (my-generator) 2 > (generator-state my-generator) 'suspended 
> (my-generator)   > (generator-state my-generator) 'done 
> (define introspective-generator (generator () ((yield 1))))  
> (introspective-generator) 1
> (introspective-generator    (lambda () (generator-state introspective-generator)))  
'running
> (generator-state introspective-generator) 'done 
> (introspective-generator) 'running  

|#