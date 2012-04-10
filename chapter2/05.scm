; Exercise 2.5: 
; Show that we can represent pairs of nonnegative inte-
; gers using only numbers and arithmetic operations if we represent
; the pair a and b as the integer that is the product 2a 3b . Give the
; corresponding definitions of the procedures cons, car, and cdr.


(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (define (car-iter x result)
    (cond
      ((odd? x) result)
      (else (car-iter (/ x 2) (+ result 1)))))

  (car-iter x 0))

(define (cdr x)
  (define (cdr-iter x result)
    (cond
      ((not (= (remainder x 3) 0)) result)
      (else (cdr-iter (/ x 3) (+ result 1)))))

  (cdr-iter x 0))