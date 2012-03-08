; Exercise 1.16: 
; Design a procedure that evolves an iterative expo-
; nentiation process that uses successive squaring and uses a loga-
; rithmic number of steps, as does fast-expt. (Hint: Using the ob-
; servation that (b ^ (n/2)) ^ 2 = (b ^ 2) ^ (n/2) , keep, along with the 
; exponent n and the base b , an additional state variable a , and define 
; the state transformation in such a way that the product ab n is unchanged
; from state to state. At the beginning of the process a is taken to
; be 1, and the answer is given by the value of a at the end of the
; process. In general, the technique of defining an invariant quan-
; tity that remains unchanged from state to state is a powerful way
; to think about the design of iterative algorithms.)

(define (expt number power) 
  (define (square x) (* x x))

  (define (expt-iter a b n)
    (cond
      ((= n 0) a)
      ((even? n) (expt-iter a (square b) (/ n 2)))
      (else (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 number power))