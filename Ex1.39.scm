(define (cont-frac-iter n d k)
  (let ((kterm (/ (n k) (d k))))
    (define (kfunc knum nextterm) (/ (n knum) (+ (d knum) nextterm)))
    (define (conthelper x result)
      (if (= x 1) result (conthelper (- x 1) (kfunc (- x 1) result))))
    (conthelper k kterm)))

(define (tan-cf x k)
  (define (tann num)
    (if (= num 1) x (- (* x x))))
  (define (tand num) (- (* 2 num) 1))
  (cont-frac-iter tann tand k))

(tan-cf 1.0 1000)
