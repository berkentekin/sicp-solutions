(define dx 0.0001)
(define (good-enough? a b) (< (abs (- a b)) 0.0001))
(define (D f) (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform g) (lambda (x) (- x (/ (g x) ((D g) x)))))

(define (iterative-improve improver tester)
  (define (ithelper guess)
    (if (tester guess (improver guess)) (improver guess) (ithelper (improver guess))))
  (ithelper 1.0))

(define (sqrt x)
  (iterative-improve (lambda (z) ((newton-transform (lambda (y) (- (* y y) x))) z)) good-enough?)) ; The improver turns z into f(z) where f = newton-transform(y^2 - x = 0)

(define (fixed-point f)
  (iterative-improve (lambda (y) (f y)) good-enough?))

(fixed-point (lambda (x) (/ (- x 2) 5))) ; -0.4999808
                                         ; the real answer is -0.5, so it works.

(sqrt 4) ; 2.000000000002716
