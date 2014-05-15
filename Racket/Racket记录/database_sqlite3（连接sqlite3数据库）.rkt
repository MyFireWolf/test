#lang racket
(require db)
;(require db/sqlite3)
(sqlite3-connect #:database "c:/my.db")

;(sqlite3-connect #:database "c:/relpath/to/my.db" #:mode 'create) 
