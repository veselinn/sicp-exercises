; Exercise 1.38: 
; In 1737, the Swiss mathematician Leonhard Euler
; published a memoir De Fractionibus Continuis, which included a
; continued fraction expansion for e − 2, where e is the base of the
; natural logarithms. In this fraction, the Ni are all 1, and the D i are
; successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, . . . . Write a program that
; uses your cont-frac procedure from Exercise 1.37 to approximate
; e , based on Euler’s expansion.

(define (cont-frac n d k)

(define (frac i)
  (cond
    ((= i k) 0)
    (else (/ (n i) 
      (+ (d i) (frac (+ i 1)))))))

(frac 1))

(+ 2 (cont-frac (lambda (x) 1.0)
  (lambda (x) 
    (cond
      ((= 0 (remainder (- x 2) 3)) (quotient x 3))
      (else 1))) 
  10))
; Yeilds 2.382978723404255 
; Not quite right.