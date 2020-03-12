(define (reverse ls)
  (if (null? (cdr ls))
      ls
      (append (reverse (cdr ls)) (list (car ls)))))

(define (deep-reverse ls)
  (define (deephelper x)
    (cond ((null? x) '())
          ((pair? (car x)) (cons (reverse (car x)) (deephelper (cdr x))))
          (else (cons (car x) (deephelper (cdr x))))))
  (reverse (deephelper ls)))

(deep-reverse (list 1 (list 2 3) 4 5 (list 6 7 8))) ; ((8 7 6) 5 4 (3 2) 1)
(deep-reverse (list (list 1 2) (list 3 4))) ; ((4 3) (2 1))

