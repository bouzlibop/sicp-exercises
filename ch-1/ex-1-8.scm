;;; Exercise 1.8.
;;;
;;; Newton’s method for cube roots is based on the fact that if y is
;;; an approximation to the cube root of x, then a better approximation
;;; is given by the value
;;;
;;;     x/y^2 + 2y
;;;     ----------
;;;          3
;;;
;;; Use this formula to implement a cube-root procedure analogous to
;;; the square-root procedure. 


(define (square x) (* x x))

(define (cube x) (* x x x))

(define (abs x) (if (< x 0) (- x) x))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))


; (newline) (display "simple good-enough")

(define (cbrt x)
  (if (< x 0)
      (- (cbrt-iter 1.0 (- x)))
      (cbrt-iter 1.0 x)))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (<  (abs (- (cube guess) x))
       0.001))

; (newline) (display "10000000 ") (display (cbrt 1000000000000000000000))
; x = 1000000000000000000000
; guess = 10000000
; exact = 10000000
; error ~= 0 %

; (newline) (display "9 ") (display (cbrt 729))
; x = 729
; guess = 9.000000000053902
; exact = 9
; error ~= 0.0000000006 %

; (newline) (display "0.0001 ") (display (cbrt .000000000001))
; x = .000000000001
; guess = .08779149522619915
; exact = 0.0001
; error ~= 87691.5 %
; (newline)


; (newline) (display "improved good-enough")

(define (cbrt x)
  (if (< x 0)
      (- (cbrt-iter 1.0 0 (- x)))
      (cbrt-iter 1.0 0 x)))
 
(define (cbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))
(define (good-enough? guess last-guess x)
  (<= (abs (- guess last-guess))
      (abs (/ guess 100000))))

; (newline) (display "10000000 ") (display (cbrt 1000000000000000000000))
; x = 1000000000000000000000
; guess = 10000000.000000061
; exact = 10000000
; error ~= 0 %

; (newline) (display "9 ") (display (cbrt 729))
; x = 729
; guess = 9.000000000053902
; exact = 9
; error ~= 0 %

; (newline) (display "0.0001 ") (display (cbrt .000000000001))
; x = .000000000001
; guess = 0.0001000000000000001
; exact = 0.0001
; error ~= 0 %
; (newline)

