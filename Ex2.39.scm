(define (fold-left op initial sequence)
  (if (null? sequence)
      initial
      (fold-left op (op initial (car sequence)) (cdr sequence))))

(define fold-right accumulate)

(define (reverse-right ls)
  (fold-right (lambda (x y) (append y (list x))) nil ls))

(define (reverse-left ls)
  (fold-left (lambda (x y) (append (list y) x)) nil ls))

(reverse-left (list 1 2 3))
