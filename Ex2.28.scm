(define (fringe ls)
  (cond ((null? ls) '())
        ((pair? (car ls)) (append (fringe (car ls)) (fringe (cdr ls))))
        (else (cons (car ls) (fringe (cdr ls))))))

(fringe (list (list 1 2 (list 5 6 7)) (list 3 4))) ; (1 2 5 6 7 3 4)
