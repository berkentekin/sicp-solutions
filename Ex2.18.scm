(define (reverse ls)
  (if (null? (cdr ls))
      ls
      (append (reverse (cdr ls)) (list (car ls)))))

(reverse (list 1 4 9 16 25)) ; (25 16 9 4 1)
