;;; Exercise 1.13.
;;;
;;; Prove that Fib(n) is the closest integer to phi^n/sqrt(5), where
;;; phi = (1 + sqrt(5))/2. Hint: Let psi = (1 - sqrt(5))/2. Use
;;; induction and the definition of the Fibonacci numbers to prove that
;;; Fib(n) = (phi^n - psi^n)/sqrt(5).

;;; Let's test proposed solution for some integers
(define (fib-test n)
  ;;; golden ratio: 1.6180339887...
  (define phi (/ (+ 1 (sqrt 5))
		 2))
  ;;; brutal implementation of exponentiation
  (define (^ n m)
    (if (= m 0)
        1
	(* n
	   (^ n (- m 1)))))
  ;;; Fib(b) is the closest integer to:
  (/ (^ phi n)
     (sqrt 5))) 
;;; for n = 0  result = 0.4472 -- 0   ✓
;;; for n = 1  result = 0.7236 -- 1   ✓
;;; for n = 2  result = 1.1708 -- 1   ✓
;;; for n = 3  result = 1.8944 -- 2   ✓
;;; for n = 4  result = 3.0652 -- 3   ✓
;;; for n = 5  result = 4.9597 -- 5   ✓
;;; for n = 6  result = 8.0249 -- 8   ✓
;;; for n = 7  result = 12.985 -- 13  ✓
;;; for n = 8  result = 21.010 -- 21  ✓
;;; for n = 9  result = 33.994 -- 34  ✓
;;; for n = 10 result = 55.004 -- 55  ✓
;;; for n = 11 result = 88.998 -- 89  ✓
;;; for n = 12 result = 144.00 -- 144 ✓

;;; Let's remind the definition of Fibonacci numbers:
;;;          0                       if n = 0
;;; Fib(n) = 1                       if n = 1
;;;          Fib(n - 1) + Fib(n - 2) otherwise
;;; 0 1 1 2 3 5 8 13 21 34 55 89 144 ...

;;; Golden ratio satisfies the equation:
;;; phi^2 = phi + 1
;;; proposed psi value shares same property:
;;; psi^2 = psi + 1

;;; Prove by induction that:
;;; Fib(n) = (phi^n - psi^n)/sqrt(5)
;;;
;;; Base case:
;;; Fib(0) = (((1 + sqrt(5))/2)^0 - ((1 - sqrt(5))/2)^0)/sqrt(5) = 0
;;; Fib(1) = (((1 + sqrt(5))/2)^1 - ((1 - sqrt(5))/2)^1)/sqrt(5) = 1
;;; Fib(2) = (((1 + sqrt(5))/2)^2 - ((1 - sqrt(5))/2)^2)/sqrt(5) = 1
;;; (
;;;   alternatively go the other way:
;;;   (a-b)/sqrt(5) = 1 and (a^2 - b^2)/sqrt(5) = 1
;;;   a = (1 + sqrt(5))/2 and b = (1 - sqrt(5))/2
;;; )
;;;
;;; Induction step:
;;; Fib(k) = (phi^k - psi^k)/sqrt(5)
;;; Fib(k + 1) = (phi^(k+1) - psi^(k+1))/sqrt(5)
;;;
;;; Fib(k + 2) = Fib(k) + Fib(k + 1)
;;; Fib(k + 2) = ((phi^k - psi^k) + (phi*phi^k - psi*psi^k))/sqrt(5)
;;; Fib(k + 2) = (phi^k*(1 + phi) - psi^k*(1 + psi))/sqrt(5)
;;; Fib(k + 2) = (phi^k*phi^2 - psi^k*psi^2)/sqrt(5)
;;; Fib(k + 2) = (phi^(k+2) - psi^(k+2))/sqrt(5) ✓
;;; (
;;;   alternatively:
;;;   a^(n+2) - b^(n+2) = a^(n+1) - b^(n+1) + a^n - b^n
;;;   a^(n)(a^2 - a - 1) = b^(n)(b^2 - b - 1)
;;;   for a = (1 + sqrt(5))/2 and b = (1 - sqrt(5))/2 -- 0 = 0
;;; )

;;; Closest integer:
;;; Fib(n) = (phi^n - psi^n)/sqrt(5)
;;; Fib(n) = phi^n/sqrt(5) - psi^n/sqrt(5)
;;;  4 <       5        < 9
;;;  2 <    sqrt(5)     < 3
;;; -3 <    -sqrt(5)    < -2 
;;; -2 <   1 - sqrt(5)  < -1 
;;; -1 < (1 - sqrt(5)/2 < -0.5
;;;  0 >       psi      > -1
;;; psi^n -> 0 as n -> ∞
;;; Fib(n) -> phi^n/sqrt(5) as n -> ∞

