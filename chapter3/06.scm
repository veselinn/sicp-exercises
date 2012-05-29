; Exercise 3.6: It is useful to be able to reset a random-number gen-
; erator to produce a sequence starting from a given value. Design
; a new rand procedure that is called with an argument that is ei-
; ther the symbol generate or the symbol reset and behaves as fol-
; lows: (rand ’generate) produces a new random number; ((rand
; ’reset) 〈new-value 〉) resets the internal state variable to the des-
; ignated 〈new-value 〉. Thus, by resetting the state, one can generate
; repeatable sequences. These are very handy to have when testing
; and debugging programs that use random numbers.

(define (make-rand)
  (let ((start-value 0))
    (define (generate)
      (+ start-value (random)))

    (define (reset new-start-value)
      (set! start-value new-start-value))

    (define (dispatch m)
      (cond
        ((eq? m `generate) (generate))
        ((eq? m `reset) reset)
        (else (error "Unknown request - MAKE-RAND" m))))

    dispatch))

(define rand (make-rand))