;;; Exercise 1.7.
;;;
;;; The good-enough? test used in computing square roots will not be
;;; very effective for finding the square roots of very small numbers.
;;; Also, in real computers, arithmetic operations are almost always
;;; performed with limited precision. This makes our test inadequate
;;; for very large numbers. Explain these statements, with examples
;;; showing how the test fails for small and large numbers.
;;; An alternative strategy for implementing good-enough? is to watch
;;; how guess changes from one iteration to the next and to stop when
;;; the change is a very small fraction of the guess. Design
;;; a square-root procedure that uses this kind of end test. Does this
;;; work better for small and large numbers?


;;; Ad 1 For small numbers the difference between x and guess (even if
;;; they differ by orders of magnitude) will be smaller than
;;; the tolerance value 0.001 used in the test. good-enough?
;;; will quickly return #t and prevents further averaging.

;;; Number: 4
;;;
;;; (sqrt-iter 1.0 4)
;;;
;;;    guess = 1.0
;;;    guess = 2.5
;;;    ...
;;;    guess = 2.0000000929222947
;;;
;;; Pecentage Error is ~ 0.000005%

;;; Very small number: 0.0001
;;;
;;; (sqrt-iter 1.0 0.0001)
;;;
;;;    guess = 1.0
;;;    guess = .50005
;;;    ...
;;;    guess = .03230844833048122
;;;
;;;    (square .03230844833048122) ; Value: 0.00104383583
;;;    (- 0.00104383583 0.001) ; Value: 0.00004383583 < 0.001
;;;
;;; Pecentage Error is ~ 223%


;;; Ad 2 The machine precision is unable to represent small differences
;;; between large numbers. good-enough? will always return #f and
;;; improve will always return same value. The algorithm will never
;;; terminate.

;;; Very large number: 10000000000000
;;;
;;; (sqrt-iter 1.0 10000000000000)
;;;
;;;   guess = 1.0
;;;   guess = 5000000000000.5
;;;   ...
;;;   guess = 3162277.6601683795     
;;;   guess = 3162277.6601683795     
;;;   ... (infinite loop)
;;;
;;;   (improve 3162277.6601683795 10000000000000)
;;;   (average 3162277.6601683795 3162277.660168379)
;;;   ; Value: 3162277.6601683795

;;; Ad 3

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     0.001))
;;; Alternative strategy
(define (good-enough? guess x)
  (<= (abs (- (improve guess x) guess))
      (* 0.001 guess)))

(define (abs x)
  (if (< x 0) (- x) x))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;;; Bonus: yet another alternative strategy - even better

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     0.1)) 
  
(define (small-enough? guess x)
  (<= (- (square guess) x) 
      (- (square (improve guess x)) x))) 
  
(define (sqrt-iter guess x) 
  (if (good-enough? guess x) 
      (if (small-enough? guess x) 
           guess 
           (sqrt-iter (improve guess x) x))  
      (sqrt-iter (improve guess x) x))) 

