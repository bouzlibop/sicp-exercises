;;; Exercise 1.12.
;;;
;;; The following pattern of numbers is called Pascal’s triangle.
;;;
;;;        1
;;;       1 1
;;;      1 2 1
;;;     1 3 3 1
;;;    1 4 6 4 1
;;;
;;; The numbers at the edge of the triangle are all 1, and each number
;;; inside the triangle is the sum of the two numbers above it. Write
;;; a procedure that computes elements of Pascal’s triangle by means of
;;; a recursive process.

;;; The elements of Pascal's traingle are called
;;; binominal coefficients.
;;; The nth row consists of the coefficients of the terms in
;;; the expansion of (x + y)^n.

;;; n-th row && k-th column is denoted:
;;;
;;; / n \
;;; \ k /
;;;
;;; n >= 0
;;; 0 <= k <= n

(define (pascal n k)
  (cond ((or (< n 0)
	     (< k 0)
	     (> k n)) "INVALID ARGUMENTS")
	((or (= k 0)
	     (= k n)) 1)
	(else (+ (pascal (- n 1) (- k 1))
		 (pascal (- n 1) k)))))

