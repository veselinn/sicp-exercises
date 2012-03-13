; Exercise 1.29: 
; Simpson’s Rule is a more accurate method of numer-
; ical integration than the method illustrated above. Using Simp-
; son’s Rule define a procedure that takes as arguments f , a , b , 
; and n and returns the value of the integral, computed using Simpson’s Rule. 
; Use your procedure to integrate cube between 0 and 1 (with n = 100 and n =
; 1000), and compare the results to those of the integral procedure
; shown above.

(define (integral f a b n) 
  (define h (/ (- b a) n))

  (define (sim-integral index)
    (cond 
      ((> index n) 0)
      (else (+ (* (f (+ a (* index h)))
            (cond
              ((or (= index 0) (= index n)) 1)
              ((even? index) 2)
              (else 4)))
          (sim-integral (+ index 1))))))
  (* (/ h 3.0) (sim-integral 0.0)))

(define (cube n) (* n n n))