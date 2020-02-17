(define (sumofsquares a b) (+ (* a a) (* b b)))

(define (bigselect a b c)
  (cond ((and (< c a) (< c b)) (sumofsquares a b))
        ((and (< a b) (< a c)) (sumofsquares b c))
        (else (sumofsquares a c))))

(bigselect 5 4 3)
