; Exercise 2.41: 
; Write a procedure to find all ordered triples of dis-
; tinct positive integers i , j , and k less than or equal to a given inte-
; ger n that sum to a given integer s .

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    null
    (cons low (enumerate-interval (+ low 1) high))))

(define (ordered-tuples low high)
  (if (>= low high)
    null
    (append (map (lambda (x) (list low x)) (enumerate-interval (+ low 1) high))
      (ordered-tuples (+ low 1) high))))


(define (ordered-triples low high)
  (if (>= low high)
    null
    (append (map 
              (lambda (pair) (cons low pair)) 
              (ordered-tuples (+ low 1) high))
      (ordered-triples (+ low 1) high))))


(define (positive-ordered-triples-to-sum upper-limit sum)
  (filter (lambda (triple) (= sum (accumulate + 0 triple))) 
    (ordered-triples 1 upper-limit)))