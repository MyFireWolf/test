#lang web-server/insta
; start: request -> response
(define (start request)
  (phase-1 request))
 
; phase-1: request -> response
(define (phase-1 request)
  (local [(define (response-generator embed/url)
            (response/xexpr
             `(html
               (body (h1 "Phase 1")
                     (a ((href ,(embed/url phase-2)))
                        "click me!")))))]
    (send/suspend/dispatch response-generator)))
 
; phase-2: request -> response
(define (phase-2 request)
  (local [(define (response-generator embed/url)
            (response/xexpr
             `(html
               (body (h1 "Phase 2")
                     (a ((href ,(embed/url phase-1)))
                        "click me!")))))]
    (print phase-1)
    (send/suspend/dispatch response-generator)))


;;;-----------------------------------------;;;
#lang web-server/insta
; start: request -> response
(define (start request)
  (show-counter 0 request))
 
; show-counter: number request -> doesn't return
; Displays a number that's hyperlinked: when the link is pressed,
; returns a new page with the incremented number.
(define (show-counter n request)
  (local [(define (response-generator embed/url)
            (response/xexpr
             `(html (head (title "Counting example"))
                    (body
                     (a ((href ,(embed/url next-number-handler)))
                        ,(number->string n))))))
 
          (define (next-number-handler request)
            (show-counter (+ n 1) request))]
 
    (send/suspend/dispatch response-generator)))