; Exercise 1.23: 
; The smallest-divisor procedure shown at the
; start of this section does lots of needless testing: After it checks to
; see if the number is divisible by 2 there is no point in checking to
; see if it is divisible by any larger even numbers. This suggests that
; the values used for test-divisor should not be 2, 3, 4, 5, 6, . . . ,
; but rather 2, 3, 5, 7, 9, . . . . To implement this change, define a pro-
; cedure next that returns 3 if its input is equal to 2 and otherwise
; returns its input plus 2. Modify the smallest-divisor procedure
; to use (next test-divisor) instead of (+ test-divisor 1).
; With timed-prime-test incorporating this modified version of
; smallest-divisor, run the test for each of the 12 primes found
; in Exercise 1.22. Since this modification halves the number of
; test steps, you should expect it to run about twice as fast. Is this
; expectation confirmed? If not, what is the observed ratio of the
; speeds of the two algorithms, and how do you explain the fact that
; it is different from 2?

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (cond
    ((= 2 n) 3)
    (else (+ 2 n))))

(define (square x) (* x x))

(define (prime? n) (= n (smallest-divisor n)))

; racket doesn't have a runtime procedure. current-inexact-milliseconds 
; returns the current time in milliseconds since midnight UTC, January 1, 1970.
(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
      (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009) ; 1009 *** 0.1220703125
; Seems like the first timed test always takes more time. No idea why.
(timed-prime-test 1013) ; 1013 *** 0.00390625
(timed-prime-test 1019) ; 1019 *** 0.00390625
(newline)

(timed-prime-test 10007) ; 10007 *** 0.009033203125
(timed-prime-test 10009) ; 10009 *** 0.008056640625
(timed-prime-test 10037) ; 10037 *** 0.008056640625
(newline)

(timed-prime-test 100003) ; 100003 *** 0.02001953125
(timed-prime-test 100019) ; 100019 *** 0.02001953125
(timed-prime-test 100043) ; 100043 *** 0.02001953125
(newline)

(timed-prime-test 1000003) ; 1000003 *** 0.05615234375
(timed-prime-test 1000033) ; 1000033 *** 0.05712890625
(timed-prime-test 1000037) ; 1000037 *** 0.057861328125

; The tests don't run twice as fast.