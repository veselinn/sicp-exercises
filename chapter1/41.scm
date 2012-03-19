; Exercise 1.41: 
; Define a procedure double that takes a procedure
; of one argument as argument and returns a procedure that applies
; the original procedure twice. For example, if inc is a procedure
; that adds 1 to its argument, then (double inc) should be a proce-
; dure that adds 2. What value is returned by
;   (((double (double double)) inc) 5)

(define (double f) (lambda (x) (f (f x))))

(define (inc x) (+ 1 x))

; (((double (double double)) inc) 5)
; (((double (lambda (x) (double (double x)))) inc) 5)
; (((lambda (x) ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x))) inc) 5)
; From there on inc is passed to the outer most lambda, which pases
; it to the inner lambdas and the fun continues.
; The end result is 21.