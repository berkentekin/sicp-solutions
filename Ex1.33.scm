(define (filtered-accumulate combiner filter? null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result)))) ; If the number doesn't pass the test, we skip to the next number
  (iter a null-value))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (self x) x)
(define (inc x) (+ x 1))

(define (relprimeprod n)
 (define (relprime? a) (= (gcd a n) 1))
 (filtered-accumulate * relprime? 1 self 1 inc n))
