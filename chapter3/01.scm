; Exercise 3.1: An accumulator is a procedure that is called repeat-
; edly with a single numeric argument and accumulates its argu-
; ments into a sum. Each time it is called, it returns the currently
; accumulated sum. Write a procedure make-accumulator that gen-
; erates accumulators, each maintaining an independent sum. The
; input to make-accumulator should specify the initial value of the
; sum; for example
; 
; (define A (make-accumulator 5))
; (A 10)
; 15
; (A 10)
; 25

(define (make-accumulator initial)
  (define (accumulate amount)
    (begin
      (set! initial (+ initial amount))
      initial))
  accumulate)