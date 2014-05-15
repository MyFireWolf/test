#lang racket
(require db)

#|
; WRONG! DANGER!
(query-exec c
  (format "UPDATE users SET passwd='~a' WHERE user='~a'"
          user new-passwd))

;; write one of the following instead (depending on SQL dialect):
   ; for PostgreSQL, SQLite
   (query-exec c "UPDATE users SET passwd=$1 WHERE user=$2" user new-passwd)
   ; for MySQL, SQLite, ODBC
   (query-exec c "UPDATE users SET passwd=? WHERE user=?" user new-passwd)

|#

(define-values (user passwd)
  (values "postgres" "rootss"))

(define pgc
  (postgresql-connect #:user user
                            #:database "yxt"
                            #:password passwd
                            #:server "127.0.0.1"
                            #:port 5432
                            #:debug? #t))
;(query-exec pgc "create temporary table the_numbers (n integer, d varchar(20))")
;(query-exec pgc "create table the_numbers (n integer, d varchar(20))")

(query-exec pgc
   "insert into the_numbers values (0, 'nothing')")
(query-exec pgc
   "insert into the_numbers values (1, 'the loneliest number')")

(query-exec pgc
   "insert into the_numbers values ($1, $2)"
   (+ 1 1)
   "company")

(query pgc "insert into the_numbers values (3, 'a crowd')")
(query pgc "select n, d from the_numbers where n % 2 = 0")
(query-rows pgc "select n, d from the_numbers where n % 2 = 0")
;(query-row pgc "select * from the_numbers where n = 0")
(query-rows pgc "select * from the_numbers where n = 0")
(query-list pgc "select d from the_numbers order by n")
(disconnect pgc)


