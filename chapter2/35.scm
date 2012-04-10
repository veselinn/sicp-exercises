; Exercise 2.35: 
; Redefine count-leaves from Section 2.2.2 as an ac
; cumulation:
;
; (define (count-leaves t)
;   (accumulate 〈??〉 〈??〉 (map 〈??〉 〈??〉)))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate 
    (lambda (x y) (cons (p x) y)) 
    null 
    sequence))

(define (count-leaves t)
  (accumulate 
    +
    0
    (map (lambda (tree) (if (list? tree) (count-leaves tree) 1)) 
      t)))