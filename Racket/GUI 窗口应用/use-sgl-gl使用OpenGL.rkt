#lang racket
(require sgl/gl    
         sgl/gl-vectors) 
(glBegin GL_TRIANGLES) 
(glVertex3i 1 2 3)
(glVertex4fv 
 (gl-float-vector 1 2 3 4)) 
(glEnd) 
;gl-frame.rkt 窗口组织框架使用选择文件关系部分,使用C++导出的wxwidget库
;(define ((mk-file-selector who put? multi? dir?)
;         message parent directory filename extension style filters dialog-mixin)
;  Calls from C++ have wrong kind of window:
;  (when (is-a? parent wx:window%)
;    (set! parent (as-entry (λ () (wx->mred parent)))))
;     .........))
(define ((example who put? multi? dir?)
         arg1 arg2)
    (print "w-func"))
((example 1 2 3 4) 5 6)

(define default-filters '(("Any" "*.*")))
;; We duplicate the definition for `get-file', `get-file-list', and
;; `put-file' so that they have the right arities and names

(define-syntax define-file-selector
  (syntax-rules ()
    [(_ name put? multi?)
     (define (name [message #f] [parent #f] [directory #f] [filename #f]
                   [extension #f] [style null] [filters default-filters]
                   #:dialog-mixin [dialog-mixin values])
       ((mk-file-selector 'name put? multi? #f)
        message parent directory filename extension style filters dialog-mixin))]))

(define-file-selector get-file      #f #f)
(define-file-selector get-file-list #f #t)
(define-file-selector put-file      #t #f)

(define ((mk-file-selector who put? multi? dir?)
         message parent directory filename extension style filters dialog-mixin)
  ;; Calls from C++ have wrong kind of window:
  (when (is-a? parent wx:window%)
    (set! parent (as-entry (λ () (wx->mred parent)))))
  
  (check-label-string/false who message)
  (check-top-level-parent/false who parent)
  (check-path/false who directory)
  (check-path/false who filename)
  (check-string/false who extension)
  (check-style who #f (cond
                        [dir? '(common enter-packages)]
                        [else '(common packages enter-packages)]) style)
  (unless (and (list? filters)
               (andmap (λ (p)
                         (and (list? p)
                              (= (length p) 2)
                              (string? (car p))
                              (string? (cadr p))))
                       filters))
    (raise-argument-error who "(listof (list/c string? string?))" filters))
  (let* ([std? (memq 'common style)]
         [style (if std? (remq 'common style) style)])
    (if std?
        (send (new (dialog-mixin path-dialog%)
                   [put?      put?]
                   [dir?      dir?]
                   [multi?    multi?]
                   [message   message]
                   [parent    parent]
                   [directory directory]
                   [filename  filename]
                   [filters
                    (cond [(eq? filters default-filters) #t] ; its own defaults
                          [dir? #f]
                          [else filters])])
              run)
        (wx:file-selector
         message directory filename extension
         ;; file types:
         filters
         ;; style:
         (cons (cond [dir?   'dir]
                     [put?   'put]
                     [multi? 'multi]
                     [else   'get])
               style)
         ;; parent:
         (and parent (mred->wx parent))))))