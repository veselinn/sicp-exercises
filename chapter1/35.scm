; Exercise 1.35: 
; Show that the golden ratio φ (Section 1.2.2) is a fixed
; point of the transformation x → 1 + 1/x , and use this fact to com-
; pute φ by means of the fixed-point procedure.

; Let f(x) = 1 + 1/x, φ = (1 + √5) / 2
; f((1 + √5)/2) = 1 + 2/(1 + √5) = 
; (1 + √5 + 2)/(1 + √5) = | * (1 - √5)/(1 - √5)
; (3 + √5)(1 - √5) / (1 + √5)(1 - √5) =
; (3 - 3√5 + √5 - 5) / (1 - 5) = 
; (-2 - 2√5) / -4 =
; (1 + √5) / 2 = φ

(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))

  (try first-guess))