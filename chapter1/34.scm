; Exercise 1.34: 
; Suppose we define the procedure
;
;   (define (f g)
;     (g 2))
;
; Then we have
;
;   (f square)
;   4
;
;   (f (lambda (z) (* z (+ z 1))))
;   6
;
; What happens if we (perversely) ask the interpreter to evaluate the
; combination (f f)? Explain.

; (f f) will be evaluated to
; (f 2) which will be evaluated to
; (2 2) and 2 is not a procedure,
; so an error will occur.