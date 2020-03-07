; In the beginning I failed to understand what the exercise was trying to achieve,
; so I checked schemewiki to have a glance at the solutions.
; I was inspired by the first solution on that wiki,
; which means I can't confidently say this solution is entirely my own creation.

(define (exp-iter n exp)
  (define (exhelper n exp result)
    (cond ((= exp 0) result)
          ((even? exp) (exhelper (* n n) (/ exp 2) result))
          (else (exhelper n (- exp 1) (* n result)))))
  (exhelper n exp 1))

(define (extractexp num baseofexp otherexp)
  (define (expfinder x base result)
    (if (= x 1) result (expfinder (/ x base) base (+ result 1))))
  (if (= (remainder num otherexp) 0) (extractexp (/ num otherexp) baseofexp otherexp) (expfinder num baseofexp 0)))

(define (my-cons a b) (* (exp-iter 2 a) (exp-iter 3 b)))
(define (my-car z) (extractexp z 2 3))
(define (my-cdr z) (extractexp z 3 2))

(my-car (my-cons 4 2)) ; 4
(my-cdr (my-cons 4 2)) ; 2
