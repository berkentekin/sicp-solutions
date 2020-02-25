(define (close-enough? a b) (< (abs (- a b)) 0.0000001))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

#|
Results:
1.
2.
1.5
1.6666666666666665
1.6
1.625
1.6153846153846154
1.619047619047619
1.6176470588235294
1.6181818181818182
1.6179775280898876
1.6180555555555556
1.6180257510729614
1.6180371352785146
1.6180327868852458
1.618034447821682
1.618033813400125
1.6180340557275543
;Value: 1.6180339631667064
|#
