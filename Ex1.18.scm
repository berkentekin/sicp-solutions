(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fastmult a b)
  (define (multhelper x y counter)
    (cond ((= y 0) counter)
          ((even? y) (multhelper (double x) (halve y) counter))
          (else (multhelper x (- y 1) (+ counter x)))))
  (multhelper a b 0))
