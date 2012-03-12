; Exercise 1.22: 
; Most Lisp implementations include a primitive
; called runtime that returns an integer that specifies the amount
; of time the system has been running (measured, for example,
; in microseconds). The following timed-prime-test procedure,
; when called with an integer n , prints n and checks to see if n is
; prime. If n is prime, the procedure prints three asterisks followed
; by the amount of time used in performing the test.
;
;   (define (timed-prime-test n)
;     (newline)
;     (display n)
;     (start-prime-test n (runtime)))
;
;   (define (start-prime-test n start-time)
;     (if (prime? n)
;         (report-prime (- (runtime) start-time))))
;
;   (define (report-prime elapsed-time)
;     (display " *** ")
;     (display elapsed-time))
;
; Using this procedure, write a procedure search-for-primes that
; checks the primality of consecutive odd integers in a specified
; range. Use your procedure to find the three smallest primes larger
; than 1000; larger than 10,000; larger than 100,000; larger than
; 1,000,000. Note the time needed to test each prime. Since the
; testing algorithm has order of growth of Θ( (sqrt n) ), you should expect
; that testing for primes around 10,000 should take about (sqrt 10) times
; as long as testing for primes around 1000. Do your timing data
; bear this out? How well do the data for 100,000 and 1,000,000
; support the Θ( (sqrt n) ) prediction? Is your result compatible with the
; notion that programs on your machine run in time proportional
; to the number of steps required for the computation?

; The prime? procedure definition
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

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


(define (search-for-primes number-to-test searches-left)
  (cond
    ((= 0 searches-left) 
      (newline)
      (display "===")
      (newline))
    ((prime? number-to-test)
      (newline)
      (display number-to-test)
      (search-for-primes (+ 1 number-to-test) (- searches-left 1)))
    (else (search-for-primes (+ 1 number-to-test) searches-left))))

(search-for-primes 1000 3) ; 1009, 1013, 1019
(search-for-primes 10000 3) ; 10007, 10009, 10037
(search-for-primes 100000 3) ; 100003, 100019, 100043
(search-for-primes 1000000 3) ; 1000003, 1000033, 1000037

(timed-prime-test 1009) ; 1009 *** 0.030029296875 
; Seems like the first timed test always takes more time. No idea why.
(timed-prime-test 1013) ; 1013 *** 0.0048828125
(timed-prime-test 1019) ; 1019 *** 0.005126953125
(newline)

(timed-prime-test 10007) ; 10007 *** 0.010009765625
(timed-prime-test 10009) ; 10009 *** 0.010009765625
(timed-prime-test 10037) ; 10037 *** 0.010986328125
(newline)

(timed-prime-test 100003) ; 100003 *** 0.028076171875
(timed-prime-test 100019) ; 100019 *** 0.02783203125
(timed-prime-test 100043) ; 100043 *** 0.028076171875
(newline)

(timed-prime-test 1000003) ; 1000003 *** 0.087890625
(timed-prime-test 1000033) ; 1000033 *** 0.086181640625
(timed-prime-test 1000037) ; 1000037 *** 0.087158203125

; As the measurments suggest the increase is close to (sqrt 10), especially 
; between 100 000 and 1 000 000.