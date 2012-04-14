; Exercise 2.18: 
; Define a procedure reverse that takes a list as argu-
; ment and returns a list of the same elements in reverse order:
;
;   (reverse (list 1 4 9 16 25))
;   (25 16 9 4 1)

(define (reverse l)
  (cond
    ((null? l) l)
    (else (append (reverse (cdr l)) (list (car l))))))