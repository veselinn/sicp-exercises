; Exercise 3.4: Modify the make-account procedure of Exercise 3.3
; by adding another local state variable so that, if an account is ac-
; cessed more than seven consecutive times with an incorrect pass-
; word, it invokes the procedure call-the-cops.

(define (make-account balance initial-password)
  (let ((cons-times-pass-failed 0))
    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
          balance)
        "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
        balance)

    (define (call-the-cops) "Calling the cops.")

    (define (protect f password)
      (if (eq? password initial-password) 
        (begin
          (set! cons-times-pass-failed 0)
          f)
        (begin
          (set! cons-times-pass-failed (+ 1 cons-times-pass-failed))
          (if (= 7 cons-times-pass-failed)
            (lambda (x) (call-the-cops))
            (lambda (x) "Incorrect password")))))

    (define (dispatch password m)   
      (cond
        ((eq? m `withdraw) (protect withdraw password))
        ((eq? m `deposit) (protect deposit password))
        (else (error "Unknown request - MAKE-ACCOUNT" m))))

    dispatch))