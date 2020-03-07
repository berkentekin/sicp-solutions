(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

(car (cons 3 8)) ; ((cons 3 8) (lambda (p q) p)) ==> ((lambda (m) (m 3 8)) (lambda (p q) p))
                 ; ==> (lambda ((lambda (p q) p)) ((lambda (p q) p) 3 8)) ==> 3 
                 ; In this case our function, m, will be the function (lambda (p q) p) which selects
                 ; the first number in a pair of numbers. In our example the function yields 3.

(define (cdr z) (z (lambda (p q) q)))
(cdr (cons 3 8)) ; 8
