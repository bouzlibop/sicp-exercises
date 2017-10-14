;;; Exercise 1.5.
;;;
;;; Ben Bitdiddle has invented a test to determine whether
;;; the interpreter he is faced with is using applicative-order
;;; evaluation or normal-order evaluation. He defines the following two
;;; procedures:
;;;
;;;     (define (p) (p))
;;;     (define (test x y)
;;;       (if (= x 0)
;;;           0
;;;           y))
;;;
;;; Then he evaluates the expression
;;;
;;;     (test 0 (p))
;;;
;;; What behavior will Ben observe with an interpreter that uses
;;; applicative-order evaluation? What behavior will he observe with
;;; an interpreter that uses normal-order evaluation? Explain your
;;; answer. (Assume that the evaluation rule for the special form if
;;; is the same whether the interpreter is using normal or applicative
;;; order: The predicate expression is evaluated first, and the result
;;; determines whether to evaluate the consequent or the alternative
;;; expression.)

(define (p) (p))
; Value: p

(define (test x y)
  (if (= x 0)
      0
      y))
; Value: test

(test 0 (p))

;;; Ad 1 What behavior will Ben observe with an interpreter that uses
;;; applicative-order evaluation?
;;;
;;; applicative-order evaluation - all the arguments to procedures
;;; are evaluated when the procedure is applied
;;;
;;; procedure: (test 0 (p))
;;; first argument: 0, will evaluate to 0
;;; second arugment: (p), evaluates to evaluation of (p); infinite loop
;;; interpreter will never terminate
;;;
;;; Ad 2 What behavior will he observe with an interpreter that uses
;;; normal-order evaluation?
;;;
;;; normal-order evaluation - delay evaluation of procedure arguments
;;; until the actual argument values are needed
;;;
;;; procedure: (test 0 (p))
;;; expands to: (if (= 0 0) 0 (p))
;;; reduced to: (if #t 0 (p))
;;; reduced to: 0

