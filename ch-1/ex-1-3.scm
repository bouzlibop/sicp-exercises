;;; Exercise 1.3.
;;;
;;; Define a procedure that takes three numbers as arguments
;;; and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))
; Value: square

(define (sum-of-squares x y)
  (+ (square x) (square y)))
; Value: sum-of-squares

(define (sum-of-squares-of-largest x y z)
        (cond ((and (> y x) (> z x)) (sum-of-squares y z))
              ((and (> x y) (> z y)) (sum-of-squares x z))
              (else (sum-of-squares x y))))
; Value: sum-of-squares-of-largest

