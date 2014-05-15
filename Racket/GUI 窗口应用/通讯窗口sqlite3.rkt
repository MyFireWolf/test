#lang racket/gui 
(require racket/gui/base) 
(require db) 

;;;声明数据库连接
;;;sqlite3建立数据库cc.db，数据库中需要包含一个叫contacts的表。
;;;表中包含三个字段，name,email,mobile,这三个字段都是TEXT类型。

(define mydb (sqlite3-connect #:database "./cc.db")) 

;声明主窗口 
(define frame (new frame% [label "联系人"])) 

;声明增加修改对话框 
(define dialog (new dialog% [label "联系人"] [parent frame])) 
(define txt-name (new text-field% [parent dialog] [label "姓名"])) 
(define txt-email (new text-field% [parent dialog] [label "email"])) 
(define txt-mobile (new text-field% [parent dialog] [label "手机"])) 

;增加修改标志 
(define selection "") 

(define main-view (new panel% [parent frame])) 

(define control-panel (new horizontal-panel% 
[parent frame] 
[style (list 'border)])) 

(define list-box (new list-box% 
[label ""] 
[parent main-view] 
[choices (query-list mydb "select name from contacts")] 
[style (list 'single)] 
[columns '("姓名")])) 


(define btn-add (new button% 
[parent control-panel] 
[label "增加"] 
[callback (lambda (button event) 
(set! selection "") 
(send txt-name set-value "") 
(send txt-email set-value "") 
(send txt-mobile set-value "") 
(send dialog refresh) 
(send dialog show #t))])) 
(define btn-edit (new button% 
[parent control-panel] 
[label "编辑"] 
[callback (lambda (button event) 
(set! selection (send list-box get-string-selection)) 
(define result-set 
(car 
(query-rows mydb 
(string-append "select * from contacts where name='" selection "'")))) 
(send txt-name set-value selection) 
(send txt-email set-value (vector-ref result-set 1)) 
(send txt-mobile set-value (vector-ref result-set 2)) 
(send dialog refresh) 
(send dialog show #t))])) 
(define btn-delete (new button% 
[parent control-panel] 
[label "删除"] 
[callback (lambda (button event) 
(query-exec mydb 
(string-append 
"delete from contacts where name='" 
(send list-box get-string-selection) "'")) 
(send list-box clear) 
(send list-box set 
(query-list mydb "select name from contacts")))])) 

(send frame resize 280 400) 
(send main-view min-height 360) 
(send list-box min-height 350) 
(send list-box min-width 270) 
(send control-panel min-height 40) 


(define dlg-panel (new horizontal-panel% [parent dialog] 
[alignment '(center center)])) 
(define btn-cancel (new button% 
[parent dlg-panel] [label "取消"] 
[callback (lambda (button event) (send dialog show #f))])) 
(define btn-ok (new button% 
[parent dlg-panel] [label "确定"] 
[callback (lambda (button event) 
(if (equal? "" selection) 
(query-exec mydb 
(string-append "insert into contacts(name,email,mobile)values('" 
(send txt-name get-value) "','" 
(send txt-email get-value) "','" 
(send txt-mobile get-value) "')")) 
(query-exec mydb 
(string-append "update contacts set name='" 
(send txt-name get-value) "',email='" 
(send txt-email get-value) "',mobile='" 
(send txt-mobile get-value) "' where name='" 
selection "'"))) 
(send list-box clear) 
(send list-box set (query-list mydb "select name from contacts")) 
(send dialog show #f))])) 

(send frame show #t) 