#lang racket
(provide input-echo)
 
(require ffi/unsafe)
(define kernel-lib 
  (ffi-lib "kernel32.dll"))
 
(define STD_INPUT_HANDLE #xfffffff6)
;#define STD_OUTPUT_HANDLE (DWORD)(0xfffffff5)
;#define STD_ERROR_HANDLE (DWORD)(0xfffffff4)
 
(define ENABLE-ECHO-INPUT 4)
 
; WINBASEAPI HANDLE WINAPI GetStdHandle(DWORD)
(define GetStdHandle
  (get-ffi-obj "GetStdHandle" kernel-lib 
	       (_fun _ulong -> _pointer)
	       (lambda ()
		 (error 'kernel32.dll
			"kernel32.dll does not provide "GetStdHandle""))))
 
; BOOL WINAPI GetConsoleMode(HANDLE,PDWORD);
(define GetConsoleMode
  (get-ffi-obj "GetConsoleMode" kernel-lib
	       (_fun (handle) :: (handle : _pointer) (mode : (_ptr o _ulong))
		     -> (succeed? : _bool)
		     ->  mode)
	       (lambda ()
		 (error 'kernel32.dll
			"kernel32.dll does not provide "GetConsoleMode""))))
 
; BOOL WINAPI SetConsoleMode(HANDLE,DWORD);
(define SetConsoleMode
  (get-ffi-obj "SetConsoleMode" kernel-lib
	       (_fun _pointer _ulong -> _bool)
	       (lambda ()
		 (error 'kernel32.dll
			"kernel32.dll does not provide "SetConsoleMode""))))
 
; DWORD WINAPI GetLastError(void);
(define GetLastError
  (get-ffi-obj "GetLastError" kernel-lib
	       (_fun -> _ulong)
	       (lambda ()
		 (error 'kernel32.dll
			"kernel32.dll does not provide "GetLastError""))))
 
(define (input-echo method)
  (let ((hdl (GetStdHandle STD_INPUT_HANDLE)))
    (match method
	   ('off (SetConsoleMode hdl 
				(bitwise-and  (GetConsoleMode hdl)
					      (bitwise-not ENABLE-ECHO-INPUT))))
	   ('on (SetConsoleMode hdl
				 (bitwise-and  (GetConsoleMode hdl)
					       ENABLE-ECHO-INPUT)))
	   ('errcode (GetLastError))
	   (_ (error 'input-echo "Only 'on or 'off method provided by input-echo fucntion")))))
 
 