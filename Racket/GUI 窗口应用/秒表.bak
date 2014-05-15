#lang racket/gui
(define frame (new frame% [label "秒表"] [width 590] [height 100]))
(define status 0)
(define start-str "00小时:00分:00秒:000毫秒")
(define x-pos 0)
(define y-pos 0)
(define start 0)
(define end 0)
(define duration 0)
(define my-dc #f)
(define my-timer (new timer% [notify-callback
                              (lambda ()
                                (set! end (current-milliseconds))
                                (set! duration (- end start))
                                (send my-dc clear)
                                (send my-dc draw-text (format-time duration) x-pos y-pos))]))
(define my-canvas%
  (class canvas%
    (super-new)
    (inherit get-dc)
    (define/override (on-char event)
      (let ([keycode (send event get-key-code)])
        (when (not (eq? keycode 'release))
          (send my-dc clear)
          (cond
           [(= status 0)
              (begin
                (set! status 1)
                (set! start (current-milliseconds))
                (send my-timer start 1))]
           [(= status 1)
              (begin
                (set! status 2)
                (send my-timer stop)
                (send my-timer notify))]
           [(= status 2)
              (begin
                (set! status 0)
                (send my-dc draw-text start-str x-pos y-pos))]))))
    (define/override (on-paint)
      (when (not my-dc)
          (set! my-dc (get-dc)))
      (send my-dc clear)
      (send my-dc set-background "black")
      (send my-dc set-text-foreground "white")
      (send my-dc set-scale 3 3)
      (send my-dc clear)
      (send my-dc draw-text start-str x-pos y-pos))))
(define (string-fill str char len #:direction [direction 'left])
  (let* ([str-len (string-length str)]
         [distance (- len str-len)])
    (if (> distance 0)
        (with-output-to-string
          (lambda ()
           
            (when (eq? direction 'right)
              (printf str))
            (let ([count 0])
              (letrec ([recur
                        (lambda ()
                          (set! count (add1 count))
                          (when (<= count distance)
                            (printf "~a" char)
                            (recur)))])
                (recur)))
            (when (eq? direction 'left)
              (printf str))))
        str)))
(define (format-time milliseconds)
  (let* ([ms (remainder milliseconds 1000)]
         [to-s (truncate (/ milliseconds 1000))]
         [s (remainder to-s 60)]
         [to-m (truncate (/ s 60))]
         [m (remainder to-m 60)]
         [h (truncate (/ to-m 60))])
    (with-output-to-string
      (lambda ()
        (printf "~a小时:~a分:~a秒:~a毫秒"
                (string-fill (number->string h) #\0 2)
                (string-fill (number->string m) #\0 2)
                (string-fill (number->string s) #\0 2)
                (string-fill (number->string ms) #\0 3))))))
(let ([my-canvas (new my-canvas% [parent frame])])
  (send frame show #t))
