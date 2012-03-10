; Exercise 1.18: 
; Using the results of Exercise 1.16 and Exercise 1.17,
; devise a procedure that generates an iterative process for multiply-
; ing two integers in terms of adding, doubling, and halving and uses
; a logarithmic number of steps.

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (fast-* a b)
  (define (fast-*-iter a b sum)
    (cond
      ((= b 0) sum)
      ((even? b) (fast-*-iter (double a) (halve b) sum))
      (else (fast-*-iter a (- b 1) (+ a sum)))))
  (fast-*-iter a b 0))