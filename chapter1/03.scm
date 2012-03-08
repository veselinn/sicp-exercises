; Exercise 1.3: 
; Define a procedure that takes three numbers as argu-
; ments and returns the sum of the squares of the two larger num-
; bers.

(define (square x) (* x x))

(define (min x y) (if (< x y) x y))

(define (sum-of-squares-of-two-largest x y z) 
  (- (+ (square x) (square y) (square z))
    (square (min x (min y z)))))