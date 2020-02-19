(define (find-divisor n beg)
  (define (divides? a b) (= (remainder b a) 0))
  (cond ((> (square beg) n) n)
        ((divides? beg n) beg)
        (else (find-divisor n (+ beg 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(smallest-divisor 199) ;199
(smallest-divisor 1999) ;1999
(smallest-divisor 19999) ;7
