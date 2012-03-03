; Exercise 1.5: 
; Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using applicative-order
; evaluation or normal-order evaluation. He defines the following
; two procedures:
; 
;   (define (p) (p))
;   (define (test x y)
;     (if (= x 0) 0 y))
; 
; Then he evaluates the expression
; 
;   (test 0 (p))
; 
; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with
; an interpreter that uses normal-order evaluation? Explain your
; answer. (Assume that the evaluation rule for the special form if
; is the same whether the interpreter is using normal or applicative
; order: The predicate expression is evaluated first, and the result
; determines whether to evaluate the consequent or the alternative
; expression.)

; The evaluation of (p) will cause an endless recursion.
; 
; Using normal-order evaluation will evaluate test first and then
; apply it with arguments 0 and (p). As "if" uses a special rule for 
; evaluation, the <alternative> won't be evaluated unless the 
; <predicate> evaluates to false. The <predicate> ((= x 0) in this 
; case) evaluates to true so the <consequent> will be evaluated, 
; 0 in this case.
;
; Using applicative-order evaluation will evaluate the arguments 
; first, (p) will be evaluated and an endless recursion will occur.