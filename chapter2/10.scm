; Exercise 2.10: 
; Ben Bitdiddle, an expert systems programmer, looks
; over Alyssa’s shoulder and comments that it is not clear what it
; means to divide by an interval that spans zero. Modify Alyssa’s code
; to check for this condition and to signal an error if it occurs.

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (div-interval x y)
  (if (= (upper-bound y) (lower-bound y))
    (display "y spans 0.") 
    (mul-interval x
      (make-interval 
        (/ 1.0 (upper-bound y))
        (/ 1.0 (lower-bound y))))))
