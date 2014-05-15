#lang racket/base
;; Experimentation with OpenGL for widgetry.
 
(require racket/class)
(require racket/gui/base)
(require sgl)
(require sgl/gl-vectors)
 
(define c%
  (class canvas%
    (inherit refresh with-gl-context swap-gl-buffers)
 
    (super-new)
 
    ;; (define/override (on-paint)
    ;;   (define dc (send this get-dc))
    ;;   (send dc set-brush "black" 'solid)
    ;;   (send dc draw-rectangle 0 0 (send this get-width) (send this get-height)))
 
    (define view-rotx 20.0)
    (define view-roty 30.0)
    (define view-rotz 0.0)
 
    (define/public (STEP)
      ;; (set! view-rotx (+ view-rotx 1))
      (set! view-roty (+ view-roty 2))
      (set! view-rotz (+ view-rotz 1))
      (refresh)
      (sleep/yield 1/60)
      (queue-callback (lambda _ (send this STEP)) #f))
 
    (define/override (on-paint)
      (with-gl-context
       (lambda ()
         (gl-clear-color 0.0 0.0 0.0 0.0)
         (gl-clear 'color-buffer-bit 'depth-buffer-bit)
 
         (gl-push-matrix)
         (gl-rotate view-rotx 1.0 0.0 0.0)
         (gl-rotate view-roty 0.0 1.0 0.0)
         (gl-rotate view-rotz 0.0 0.0 1.0)
 
         (define (face xr yr zr)
           (gl-push-matrix)
           (gl-rotate xr 1.0 0.0 0.0)
           (gl-rotate yr 0.0 1.0 0.0)
           (gl-rotate zr 0.0 0.0 1.0)
           (gl-translate 0 0 1)
           (gl-color 1 1 0) (gl-rect 0 0 1 1)
           (gl-color 1 0 0) (gl-rect -1 -1 0 0)
           (gl-color 0 1 0) (gl-rect -1 0 0 1)
           (gl-color 0 0 1) (gl-rect 0 -1 1 0)
           (gl-pop-matrix))
 
         (face 0 0 0)
         (face 90 0 0)
         (face 0 90 0)
 
         (face 0 180 0)
         (face 90 180 0)
         (face 0 270 0)
 
         ;; (gl-begin 'quads)
         ;; (gl-normal 0 0 1)
         ;; (gl-vertex -1 -1 1)
         ;; (gl-vertex 1 -1 1)
         ;; (gl-vertex 1 1 1)
         ;; (gl-vertex -1 1 1)
         ;; (gl-end)
 
         (gl-pop-matrix)
 
         (swap-gl-buffers)
         (gl-flush))))
 
    (define/override (on-event e)
      (when (is-a? e mouse-event%)
	(when (eq? (send e get-event-type) 'left-down)
	  (exit 0))))
 
    (define/override (on-size width height)
      (with-gl-context
       (lambda ()
         (gl-viewport 0 0 width height)
 
         (gl-matrix-mode 'projection)
         (gl-load-identity)
         (let ((h (/ height width)))
           (gl-frustum -1.0 1.0 (- h) h 5.0 60.0))
 
         (gl-matrix-mode 'modelview)
         (gl-load-identity)
         (gl-translate 0.0 0.0 -40.0)
 
         (gl-light-v 'light0 'position (vector->gl-float-vector
                                        (vector 5.0 5.0 10.0 0.0)))
         (gl-enable 'cull-face)
         (gl-enable 'lighting)
         (gl-enable 'light0)
         (gl-enable 'depth-test)
 
         ;;(gl-material-v 'front 'ambient-and-diffuse (vector->gl-float-vector (vector 1 1 0 1)))
         ;;(gl-material-v 'front 'specular (vector->gl-float-vector (vector 1 1 1 1)))
         ;;(gl-material-v 'front 'emission (vector->gl-float-vector (vector 0 0 0 1)))
         (gl-color-material 'front 'ambient-and-diffuse)
         (gl-enable 'color-material)
         ))
      (refresh))
 
    ))
 
(module+ main
  (define-values (W H) (get-display-size #t))
  (define f (new frame%
                 [style '(no-resize-border
                          no-caption
                          no-system-menu
                          hide-menu-bar)]
                 [label "glui"]
                 [width W]
                 [height H]))
  (define c (new c%
                 [parent f]
                 [style '(gl)]))
  (send f show #t)
  (send f center 'both)
 
  (send c STEP))