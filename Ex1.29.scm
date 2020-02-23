(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (simpson f a b n) ; not the most minimalistic way to code this to be honest
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (term q)
    (cond ((or (= q 0) (= q n)) (yk q))
          ((even? q) (* 2 (yk q)))
          (else (* 4 (yk q)))))
  (* (/ h 3) (sum term 0 inc n)))

(simpson cube 0 1.0 100)  ; 0.24999999999999992
(simpson cube 0 1.0 1000) ; 0.2500000000000003

