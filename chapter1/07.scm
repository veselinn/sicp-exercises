; Exercise 1.7: 
; The good-enough? test used in computing square
; roots will not be very effective for finding the square roots of very
; small numbers. Also, in real computers, arithmetic operations are
; almost always performed with limited precision. This makes our
; test inadequate for very large numbers. Explain these statements,
; with examples showing how the test fails for small and large num-
; bers. An alternative strategy for implementing good-enough? is to
; watch how guess changes from one iteration to the next and to
; stop when the change is a very small fraction of the guess. Design
; a square-root procedure that uses this kind of end test. Does this
; work better for small and large numbers?

; The implementation of the Newton's method for square roots is 
; shown below for reference.
;
; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;                 x)))
;
; (define (improve guess x)
;   (average guess (/ x guess)))
;
; (define (average x y)
;   (/ (+ x y) 2))
; 
; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))
; 
; (define (square x) 
;   (* x x))
;
; (define (sqrt x)
;   (sqrt-iter 1.0 x))
;
; Let's find the square root of 0,000004. On the 5th iteration(when the 
; guess is ~0,312) the good-enough? predicate succeeds, because the 
; difference between the searched square root and the target parameter 
; is less than 0,001.

(define (good-enough? guess)
  (< (abs (- (improve guess) guess))
      (* guess 0.0001)))