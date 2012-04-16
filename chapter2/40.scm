; Exercise 2.40: 
; Define a procedure unique-pairs that, given an in-
; teger n , generates the sequence of pairs (i , j ) with 1 ≤ j < i ≤ n .
; Use unique-pairs to simplify the definition of prime-sum-pairs
; given above.

(define (enumerate-interval low high)
  (if (> low high)
    null
    (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs low high)
  (if (>= low high)
    null
    (append (map (lambda (x) (cons high x)) (enumerate-interval low (- high 1)))
      (unique-pairs low (- high 1)))))