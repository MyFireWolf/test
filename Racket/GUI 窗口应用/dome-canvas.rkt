#lang racket/gui

#|
(require racket/draw)
(define target (make-bitmap 30 30))
(define dc (new bitmap-dc% [bitmap target])) 
(send dc draw-rectangle 
      0 10  
      30 10) 

(send dc draw-line    
      0 0         
      30 30)
(send dc draw-line 
      0 30            
      30 0)  
|#

(define frame (new frame% 
                   [label "Example"]
                   [width 300] 
                   [height 300] ))
;;;添加菜单
(define menu-bar (new menu-bar% 
                      (parent frame)))
(define menu1 (new menu% (label "&File") (parent menu-bar))) 
(new menu% (label "&Edit") (parent menu-bar))
(new menu% (label "&Help") (parent menu-bar)) 

;;;添加菜单&File下的 Open 显示对话框窗口(默认是模式对话框)
(new menu-item% (label "&Open") 
     [callback 
      (lambda (menu event)       
        (message-box  "title" "message...") ;;;显示信息对话框

        
        (define dialog (instantiate dialog% ("Example"))) 
        (new text-field% [parent dialog] [label "Your name"]) 
        (define panel (new horizontal-panel% 
                           [parent dialog]  
                           [alignment '(center center)])) 
        (new button% [parent panel] [label "Cancel"])
        (new button% [parent panel] [label "Ok"]) 
        (when (system-position-ok-before-cancel?) 
          (send panel change-children reverse))  
        (send dialog show #t))]
     [parent menu1]) 


;;;添加按钮，画布等控件

(define msg (new message% [parent frame]   
                 [label "No events so far..."]))  
(define panel (new horizontal-panel%
                   [parent frame]))
(new button% [parent panel]   
     [label "Click Me"]        
     [callback (lambda (button event)                        
                 (send msg set-label "Button click"))]) 
(define my-canvas%  
  (class canvas%      
    (define/override (on-event event)  
      (send msg set-label "Canvas mouse"))  
    (define/override (on-char event)    
      (send msg set-label "Canvas keyboard"))  
    (super-new)))   

(new my-canvas% 
     [parent panel]
     [paint-callback           
      (lambda (canvas dc)     
        (send dc set-scale 3 3)   
        (send dc set-text-foreground "blue") 
        (send dc draw-text "Don't Panic!" 0 0)
        
        ;(send dc draw-rectangle 0 10 30 10) 
        ;(send dc draw-line 0 0 30 30)
        ;(send dc draw-line 0 30 30 0)
        
        (send dc draw-line 30 40 40 10)
        )]) 

        
(send frame show #t) 