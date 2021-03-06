;;; Exercise 1.11.
;;;
;;; A function f is defined by the rule that f(n) = n if n < 3 and
;;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3. Write
;;; a procedure that computes f by means of a recursive process.
;;; Write a procedure that computes f by means of an iterative process.
;;;
;;; ---
;;;
;;; 0, 1, 2, 4, 11, 25, 59, 142, 335, 796, 1892, ...
;;;
;;; Ad 1 recursive process
;;;
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
;;;
;;; Ad 2 iterative process 
;;;
;;; f(0) = 0
;;; f(1) = 1
;;; f(2) = 2
;;;
;;; a <- a + 2b + 3c
;;; b <- a
;;; c <- b
;;;
(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
        c
	(f-iter (+ a (* 2 b) (* 3 c)) a  b (- count 1))))
  (f-iter 2 1 0 n))

