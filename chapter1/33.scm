; Exercise 1.33: 
; You can obtain an even more general version
; of accumulate (Exercise 1.32) by introducing the notion of a
; filter on the terms to be combined. That is, combine only those
; terms derived from values in the range that satisfy a specified
; condition.
; The resulting filtered-accumulate abstraction
; takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the filter.
; Write filtered-accumulate as a procedure. Show how to express
; the following using filtered-accumulate:
; a. the sum of the squares of the prime numbers in the interval a to
; b (assuming that you have a prime? predicate already written)
; b. the product of all the positive integers less than n that are
; relatively prime to n (i.e., all positive integers i < n such that
; GCD(i , n ) = 1).

(define (filtered-accumulate combiner null-value filter term a next b)
  (define (filtered-accumulate-iter a result)
    (cond
      ((> a b) result)
      ((filter a) (filtered-accumulate-iter (next a) (combiner (term a) result)))
      (else (filtered-accumulate-iter (next a) result))))
  (filtered-accumulate-iter a null-value))

; a. the sum of the squares of the prime numbers in the interval a to
; b (assuming that you have a prime? predicate already written)

(define (square n) (* n n))
(define (inc n) (+ 1 n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n) (= n (smallest-divisor n)))

(define (prime-squares-sum a b)
  (filtered-accumulate + 0 prime? square a inc b))

; b. the product of all the positive integers less than n that are
; relatively prime to n (i.e., all positive integers i < n such that
; GCD(i , n ) = 1).

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (relatively-prime? a b)
  (= (gcd a b) 1))

(define (identity x) x)

(define (relatively-prime-product b)
  (define (relatively-prime-with-b? a) (relatively-prime? a b))

  (filtered-accumulate * 1 relatively-prime-with-b? identity 1 inc b))