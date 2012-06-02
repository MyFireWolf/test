(require 'clsql)
(defun sqliteconnection (db-name)
  (clsql:connect (list db-name) :database-type :sqlite3)
)

(defun sqlitecloses ()
  (clsql:disconnect)
)

(defun sqliteexecute (str)
  (clsql:execute-command str)
)

(defun sqlitequery (str)
  (clsql:query str)
  )

(defun sqliteupdate (str updatestr)

  (setq upstr (format nil "update t set a='~a' where a='~a'" updatestr str))
  (sqliteexecute upstr)

  )
;;(setq upstr (format nil "update t set a='~a' where a='~a'" "a" (car (car one))))