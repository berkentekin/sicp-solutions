(define (product term a next b) ; Decided to make it an iterative procedure
  (define (iter a result)
    (if (> a b) result (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc x) (+ x 1))

(define (self x) x)

(define (factorial x) (if (= x 0) 1 (product self 2 inc x))) ; Increased efficiency by skipping multiplication by 1

(define (pifinder limit)
  (define (piterm n)
    (if (odd? n)
        (/ (+ n 1) (+ n 2))
        (/ (+ n 2) (+ n 1))))
  (* 4 (product piterm 1.0 inc limit)))
