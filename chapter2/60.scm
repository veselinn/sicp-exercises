; Exercise 2.60: We specified that a set would be represented as a
; list with no duplicates. Now suppose we allow duplicates. For
; instance, the set {1, 2, 3} could be represented as the list (2 3 2
; 1 3 2 2). Design procedures element-of-set?, adjoin-set,
; union-set, and intersection-set that operate on this repre-
; sentation. How does the efficiency of each compare with the
; corresponding procedure for the non-duplicate representation?
; Are there applications for which you would use this representation
; in preference to the non-duplicate one?

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
  (else (element-of-set? x (cdr set)))))

(define adjoin-set cons)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
          (cons (car set1)
                (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (define (union set resulting-set)
    (cond ((null? set) resulting-set)
          ((element-of-set? (car set) resulting-set) 
            (union (cdr set) resulting-set))
          (else (union (cdr set) (cons (car set) resulting-set)))))
  (union set1 set2))

; adjoin-set is faster as it is only a cons operation.
; union-set and intersection-set are slower as there can be more 
; elements in the sets(since the elements are not filtered when added).
; The version with the duplicates is probably better when we have a lots
; of adjoin-set operation and very few union-set and intersection-set.