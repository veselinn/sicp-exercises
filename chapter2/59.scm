; Exercise 2.59: Implement the union-set operation for the
; unordered-list representation of sets.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
  (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (define (union set resulting-set)
    (cond ((null? set) resulting-set)
          ((element-of-set? (car set) resulting-set) 
            (union (cdr set) resulting-set))
          (else (union (cdr set) (cons (car set) resulting-set)))))
  (union set1 set2))