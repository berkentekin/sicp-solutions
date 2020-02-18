;Recursive

(define (frec n)
  (if (< n 3) n (+ (frec (- n 1)) (* 2 (frec (- n 2))) (* 3 (frec (- n 3))))))

;Iterative

(define (fiter n)
  (define (fhelper a b c count)
    (cond ((= count 0) a)
          (else (fhelper b c (+ c (* 2 b) (* 3 a)) (- count 1)))))
  (fhelper 0 1 2 n))


