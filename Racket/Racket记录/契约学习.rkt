#lang   racket
( provide   ( contract-out   [ amount   positive? ] ) )
( define   amount   ... ) 

#lang   racket/base
( require   racket/contract )   ;   now we can write contracts
( provide   ( contract-out   [ amount   positive? ] ) )
; ( provide   ( contract-out   [ amount   ( and/c   number?   positive? ) ] ) )
( define   amount   ... ) 

#| any/c 表示任何单一的值 
   and/c 表示连接多个合约，可以理解为 a and b的方式  number? 表示是不是一个数  positive? 是不是一个正数
   所以(and/c  number?  positive?)  整个表示一个正数
   ( ->   integer?   any ) 描述了一个接受一个整数并返回任意数量的值的函数
   ( ->   integer?   any/c ) 描述了接受一个整数并产生一个结果（但不说什么更多的结果）的函数。
   
   ( define   ( f   x )   ( values   ( +   x   1 )   ( -   x   1 ) ) )
   matches ( -> integer? any ) , but not ( -> integer? any/c ) . 

   ( ->   integer?   ( ->   integer?   integer? ) )
   ( ->   ( ->   integer?   integer? )   integer? )


 ( provide   ( contract-out
           [ ask-yes-or-no-question
            ( -> *   ( string?
                  #:default   boolean? )
                 ( #:title   string?
                  #:width   exact-integer?
                  #:height   exact-integer? )
 
                 boolean? ) ] ) ) 


 ( provide   ( contract-out
           [ ask-yes-or-no-question
            ( ->   string?
                #:default   boolean?
                #:title   string?
                #:width   exact-integer?
                #:height   exact-integer?
                boolean? ) ] ) ) 