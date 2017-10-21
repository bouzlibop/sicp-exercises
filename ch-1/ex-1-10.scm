;;; Exercise 1.10.
;;;
;;; The following procedure computes a mathematical function called
;;; Ackermann’s function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;;; What are the values of the following expressions?

(A 1 10)
; Value: 1024

(A 2 4)
; Value: 65536

(A 3 3)
; Value: 65536

;;; Side note: the evolution of this procedure is beautiful to watch.

;;; Consider the following procedures, where A is the procedure defined
;;; above:

;;; (define (f n) (A 0 n))
;;; (define (g n) (A 1 n))
;;; (define (h n) (A 2 n))
;;; (define (k n) (* 5 n n))

;;; Give concise mathematical definitions for the functions computed by
;;; the procedures f, g, and h for positive integer values of n. For
;;; example, (k n) computes 5n^2 .

;;; (f n) computes 2n
;;; (g n) computes 0, 2^n for n > 0
;;; (h n) computes (0, 2, 2^2, 2^4, 2^16, ...) or (2^(h n-1))
;;; (k n) computes 5n^2

