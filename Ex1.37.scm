;I'll admit this is not the prettiest code, besides the recursive procedure goes from top to bottom
;while the iterative procedure goes from bottom to top.

(define (cont-frac-rec n d k)
  (let ((kterm (/ (n k) (d k))))
    (define (kfunc knum nextterm) (/ (n knum) (+ (d knum) nextterm)))
    (define (conthelper x)
      (if (= x k) kterm (kfunc x (conthelper (+ x 1)))))
    (conthelper 1)))

(define (cont-frac-iter n d k)
  (let ((kterm (/ (n k) (d k))))
    (define (kfunc knum nextterm) (/ (n knum) (+ (d knum) nextterm)))
    (define (conthelper x result)
      (if (= x 1) result (conthelper (- x 1) (kfunc x result))))
    (conthelper k kterm)))

(/ 1 (cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) 1000)) ; 1.618033988749895
(/ 1 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 1000)) ; 1.618033988749895
