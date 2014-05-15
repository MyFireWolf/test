#lang racket
(require compatibility/defmacro)
(define-macro (test-macro x)
  `(begin
     (printf "begin..\n")
     ,x
     (printf "\n")
     (printf "end..")))

(test-macro (print "yxt"))

(define-syntax my-if
  (lambda (x)
    ;;establish that "then" and "else" are keywords
    (syntax-case x (then else)
      (
        ;;pattern to match
        (my-if condition then yes-result else no-result)
        ;;transformer
        (syntax (if condition yes-result no-result))
       )
)))

(define-syntax my-if2
  (lambda (x)
    ;;establish that "then" and "else" are keywords
    (syntax-case x (then else)
      (
        ;;pattern to match
        (my-if condition then yes-result else no-result)
        ;;transformer
        (syntax (if condition yes-result no-result))
       )
)))

(define-syntax my-for
  (lambda (x)
    (syntax-case x (in)
      (
       (my-for i in lst)
       (syntax (car lst))
       )
      )))
(my-for i in '(1 2 3))
               
#|
;(define defmacro define-macro)

CL-USER> (defmacro b (&rest ags)
           `(quote ,ags))
B
CL-USER> (b (> a b))
((> A B))
CL-USER> (b (> a b) then (print "a") else (print "b"))
((> A B) THEN (PRINT "a") ELSE (PRINT "b"))
CL-USER> 


如果想自己实现 delay + force 
;; 无记忆
;(define-syntax delay
;  (syntax-rules ()
;    ((_ x) (lambda () x))))

;; 有记忆
(define-syntax delay
  (syntax-rules ()
    ((_ x) (memo-proc (lambda () x)))))

|#