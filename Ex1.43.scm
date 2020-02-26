(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f times)
  (if (= times 0) (lambda (x) x) (compose f  (repeated f (- times 1))))) ; Order of growth O(n) 

(define (repeated-with-fast-expt f times)
  (cond ((= times 0) (lambda (x) x))
        ((even? times) (experiment (compose f f) (/ times 2)))
        (else (compose f (experiment f (- times 1)))))) ; Order of growth O(log(n))

((repeated-with-fast-expt square 2) 5) ; 625
