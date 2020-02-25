(define (cont-frac-iter n d k)
  (let ((kterm (/ (n k) (d k))))
    (define (kfunc knum nextterm) (/ (n knum) (+ (d knum) nextterm)))
    (define (conthelper x result)
      (if (= x 1) result (conthelper (- x 1) (kfunc (- x 1) result))))
    (conthelper k kterm)))

(define (eulerd num)
  (if (= (remainder (abs (- num 2)) 3) 0) (/ (* 2 (+ num 1)) 3) 1))

(+ 2 (cont-frac-iter (lambda (x) 1.0) eulerd 1000)) ; 2.7182818284590455
