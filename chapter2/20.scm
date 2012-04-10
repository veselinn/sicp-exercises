; Exercise 2.20: 
; The procedures +, *, and list take arbitrary num-
; bers of arguments. One way to define such procedures is to use
; define with dotted-tail notation. 
; Use dotted-tail notation to write a procedure same-parity that takes one
; or more integers and returns a list of all the arguments that have
; the same even-odd parity as the first argument. For example,
;
;   (same-parity 1 2 3 4 5 6 7)
;   (1 3 5 7)
;   (same-parity 2 3 4 5 6 7)
;   (2 4 6)

(define (same-parity example-parity-number . numbers)
  (define parity (remainder example-parity-number 2))

  (define (filter-by-parity numbers)
    (cond
      ((null? numbers) null)
      ((= (remainder (car numbers) 2) parity) 
        (cons (car numbers) (filter-by-parity (cdr numbers))))
      (else (filter-by-parity (cdr numbers)))))

  (cons example-parity-number (filter-by-parity numbers)))