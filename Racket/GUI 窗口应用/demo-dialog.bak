#lang racket/gui
(define dialog (instantiate dialog% ("Example"))) 
; Add a text field to the dialog 
(new text-field% [parent dialog] [label "Your name"])  
; Add a horizontal panel to the dialog, with centering for buttons 
(define panel (new horizontal-panel% [parent dialog]  
                   [alignment '(center center)])) 
; Add Cancel and Ok buttons to the horizontal panel
(new button% [parent panel] [label "Cancel"])
(new button% [parent panel] [label "Ok"]) 
(when (system-position-ok-before-cancel?) 
  (send panel change-children reverse))  
; Show the dialog
(send dialog show #t) 