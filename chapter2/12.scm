; Exercise 2.12: 
; Define a constructor make-center-percent that
; takes a center and a percentage tolerance and produces the
; desired interval. You must also define a selector percent that
; produces the percentage tolerance for a given interval. The center
; selector is the same as the one shown above.

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (make-center-width center width)
  (make-interval (- center width) (+ center width)))
(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2.0))
(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (make-center-percent center tolerance-percent)
  (make-center-width center (* tolerance-percent center)))

(define (percentage-tolerance interval) 
  (/ width center))