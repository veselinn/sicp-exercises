; Exercise 1.9:
; Each of the following two procedures defines
; a method for adding two positive integers in terms of the
; procedures inc, which increments its argument by 1, and dec,
; which decrements its argument by 1.
;
; (define (+ a b)
; (if (= a 0) b (inc (+ (dec a) b))))
;
; (define (+ a b)
; (if (= a 0) b (+ (dec a) (inc b))))
;
; Using the substitution model, illustrate the process generated by
; each procedure in evaluating (+ 4 5). Are these processes itera-
; tive or recursive?

; The first process is recursive as the inc procedure needs the result
; of (+ (dec a) b), which can invoke inc again, which needs the result
; of (+ (dec a) b) etc. See below for a sample call.
;
; (+ 4 5);
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
;
; The second process is iterative as all the state is captured by the
; arguments of the procedure(a and b).
;
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9