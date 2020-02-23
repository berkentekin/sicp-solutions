(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter combiner a result)
    (if (> a b) result (iter combiner (next a) (+ (term a) result))))
  (iter combiner a null-value))
