(define dx 0.00001)
(define (deriv g) (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform f) (lambda (x) (- x (/ (f x) ((deriv f) x)))))

(define (close-enough? a b) (< (abs (- a b)) 0.0001))

(define (fixed-point f guess)
  (let ((next (f guess)))
    (if (close-enough? guess next)
        next
        (fixed-point f next))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c) (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 1 2 3) 1) ; -1.2756822036498454 (correct)
