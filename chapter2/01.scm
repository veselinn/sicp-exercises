; Exercise 2.1: 
; Define a better version of make-rat that handles both
; positive and negative arguments. Make-rat should normalize the
; sign so that if the rational number is positive, both the numerator
; and denominator are positive, and if the rational number is nega-
; tive, only the numerator is negative.

(define (make-rat n d) 
  (cond
    ((and (> n 0) (> d 0)) (cons n d))
    ((and (< n 0) (< d 0)) (cons (- n) (- d)))
    ((and (> n 0) (< d 0)) (cons n d))
    (esle (cons (- n) (- d)))))

(define (numer x) (car x))
(define (denom x) (cdr x))