;;; Exercise 1.4.
;;;
;;; Observe that our model of evaluation allows for combinations whose
;;; operators are compound expressions. Use this observation to
;;; describe the behavior of the following procedure:
;;;
;;;     (define (a-plus-abs-b a b)
;;;       ((if (> b 0) + -) a b))

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; Value: a-plus-abs

;;; The above procedure behave as follows:
;;; if b > 0 than evaluate (+ a b)
;;; otherwise evaluate (- a b)
;;;
;;; The above procedure is equivalent to: a + |b|

