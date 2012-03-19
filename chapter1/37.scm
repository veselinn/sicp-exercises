; Exercise 1.37:
; a. infinite continued fraction
; As an example, one can show that the infinite continued
; fraction expansion with the Ni and the D i all equal to 1
; produces 1/φ, where φ is the golden ratio (described in Section
; 1.2.2). One way to approximate an infinite continued fraction is
; to truncate the expansion after a given number of terms. Such
; a truncation—a so-called k-term finite continued fraction
; Suppose that n and d are procedures of one argument (the term
; index i ) that return the Ni and D i of the terms of the contin-
; ued fraction. Define a procedure cont-frac such that evalu-
; ating (cont-frac n d k) computes the value of the k -term fi-
; nite continued fraction. Check your procedure by approximat-
; ing 1/φ using
;
;   (cont-frac (lambda (i) 1.0)
;     (lambda (i) 1.0)
;     k)
;
; for successive values of k. How large must you make k in order
; to get an approximation that is accurate to 4 decimal places?
;
; b. If your cont-frac procedure generates a recursive process,
; write one that generates an iterative process. If it generates an
; iterative process, write one that generates a recursive process.

; Recursive
(define (cont-frac n d k)

  (define (frac i)
    (cond
      ((= i k) 0)
      (else (/ (n i) 
        (+ (d i) (frac (+ i 1)))))))

  (frac 1))

(cont-frac (lambda (i) 1.0)
  (lambda (i) 1.0)
  15)
; Yields 0.6180327868852459

; Iterative
(define (cont-frac n d k)

  (define (iter i result)
    (cond 
      ((= i 0) result)
      (else (iter (- i 1)
                  (/ (n i) (+ (d i) result))))))

  (iter k 0))

(cont-frac (lambda (i) 1.0)
  (lambda (i) 1.0)
  15)
; Yields 0.6180344478216819