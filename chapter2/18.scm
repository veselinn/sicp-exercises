; Exercise 2.18: 
; Define a procedure reverse that takes a list as argu-
; ment and returns a list of the same elements in reverse order:
;
;   (reverse (list 1 4 9 16 25))
;   (25 16 9 4 1)

(define (reverse l)
  (define (reverse-proc list)
    (cond
      ((null? list) list)
      (else (cons (reverse (cdr list)) (car list)))))
  (reverse-proc (cons (cons (car l) null) (cdr l))))

; (cons (r 4 9 16 25) 1)
; (cons (cons (r 9 16 25) 4) 1)
; (cons (cons  (cons (r 16 25) 9) 4) 1)
; (cons (cons  (cons (cons (r 25) 16) 9) 4) 1)

(display (reverse (list 1 4 9 16 25)))