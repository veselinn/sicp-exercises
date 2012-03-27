; Exercise 2.3: 
; Implement a representation for rectangles in a plane.
; (Hint: You may want to make use of Exercise 2.2.) In terms of
; your constructors and selectors, create procedures that compute
; the perimeter and the area of a given rectangle. Now implement
; a different representation for rectangles. Can you design your sys-
; tem with suitable abstraction barriers, so that the same perimeter
; and area procedures will work using either representation?


; Solution A
(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (points-distance p1 p2)
  (sqrt (+ (square (- (x-point p1) (x-point p2)))
          (square (- (y-point p1) (y-point p2))))))


(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (segment-length segment) 
  (points-distance 
    (start-segment segment)
    (end-segment segment)))

(define (make-rectangle a b) (cons a b))
(define (a-side rectangle) (car rectangle))
(define (b-side rectangle) (cdr rectangle))

(define (perimeter rectangle)
  (+ (* (segment-length (a-side rectangle)) 2)
    (* (segment-length (b-side rectangle)) 2)))

(define (area rectangle)
  (* (segment-length (a-side rectangle))
    (segment-length (b-side rectangle))))

(define r (make-rectangle 
  (make-segment (make-point 0 0) (make-point 0 5))
  (make-segment (make-point 0 0) (make-point 5 0))))

(display (perimeter r))
(newline)
(display (area r))