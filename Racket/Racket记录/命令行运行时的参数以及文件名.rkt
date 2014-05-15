#lang racket
 
(define (extract str)
  (for ([i  str])
  (display (substring i 4 7))))
 
(extract (current-command-line-arguments))
(newline)
(find-system-path 'run-file);;; 获取当前运行的文件名

;(print (current-command-line-arguments))
;racket 命令行运行时的参数以及文件名.rkt testargument
(path->string (find-system-path 'run-file))
(struct a (x y))
(filename-extension "c:/www/ttt/a.exe")
(current-directory)