; Exercise 2.29: 
; A binary mobile consists of two branches, a left
; branch and a right branch. Each branch is a rod of a certain
; length, from which hangs either a weight or another binary
; mobile. We can represent a binary mobile using compound data
; by constructing it from two branches (for example, using list):
; 
;   (define (make-mobile left right)
;     (list left right))
; 
; A branch is constructed from a length (which must be a number)
; together with a structure, which may be either a number (repre-
; senting a simple weight) or another mobile:
; 
;   (define (make-branch length structure)
;     (list length structure))
; 
; a. Write the corresponding selectors left-branch and right-
; branch, which return the branches of a mobile, and branch-
; length and branch-structure, which return the components
; of a branch.
; b. Using your selectors, define a procedure total-weight that re-
; turns the total weight of a mobile.
; c. A mobile is said to be balanced if the torque applied by its top-
; left branch is equal to that applied by its top-right branch (that
; is, if the length of the left rod multiplied by the weight hanging
; from that rod is equal to the corresponding product for the right
; side) and if each of the submobiles hanging off its branches is
; balanced. Design a predicate that tests whether a binary mobile
; is balanced.
; d. Suppose we change the representation of mobiles so that the
; constructors are
; 
;   (define (make-mobile left right)
;     (cons left right))
;   (define (make-branch length structure)
;     (cons length structure))
; 
; How much do you need to change your programs to convert to
; the new representation?


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;  A

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; B

(define (branch? x)
  (and (list? x) (number? (car x))))

(define (mobile? x)
  (and (list? x)
    (branch? (left-branch x))
    (branch? (right-branch x))))

(define (total-weight x)
  (cond
    ((mobile? x) (+ (total-weight (branch-structure (left-branch x)))
                    (total-weight (branch-structure (right-branch x)))))
    (else x)))

; (define mobile 
;   (make-mobile 
;     (make-branch 2 10)
;     (make-branch 2 (make-mobile
;       (make-branch 3 15)
;       (make-branch 3 (make-mobile
;         (make-branch 1 10)
;         (make-branch 1 100)))))))
; 
; (display (total-weight mobile))

; C

(define (balanced? x)
  (cond
    ((mobile? x) (and 
      (= (* (branch-length (left-branch x)))
            (total-weight (left-branch x))
          (* branch-length (right-branch x))
            (total-weight (right-branch x)))
      (balanced? (branch-structure (left-branch x)))
      (balanced? (branch-structure (right-branch x)))))
    (else true)))

; D

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

; We need to change the selectors and the branch? and mobile? predicates:

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (branch? x)
  (and (pair? x) (number? (car x))))

(define (mobile? x) 
  (and (pair? x) 
    (branch? (left-branch x))
    (branch? (right-branch x))))