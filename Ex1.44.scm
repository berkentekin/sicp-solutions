(define (repeated f times)
  (cond ((= times 0) (lambda (x) x))
        ((even? times) (repeated (compose f f) (/ times 2)))
        (else (compose f (repeated f (- times 1))))))

(define dx 0.00001)
(define (square x) (* x x))

(define (compose f g) (lambda (x) (f (g x))))

(define (nfoldsmooth f x times)
  (define (smooth f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
  (((repeated smooth times) f) x))

(nfoldsmooth square 2 10) ; 4.000000000666667
