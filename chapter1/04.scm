; Exercise 1.4: 
; Observe that our model of evaluation allows for com-
; binations whose operators are compound expressions. Use this
; observation to describe the behavior of the following procedure:
; 
;   (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))

; The expression (if (> b 0) + -) returns the function + if b 
; is positive and returns the operation - otherwise. So the whole
; a-plus-abs-b function has the following definition:
;
;   a + b, if b is positive
;   a - b, otherwise
;
; which in turn is 
;
;   a + |b|, where |b| is the absolute value of b
;
; which is exactly what the name of the function implies - the sum of
; a and the absolute value of b.