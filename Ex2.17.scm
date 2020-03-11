(define (last-pair ls)
  (cond ((null? (car ls)) (error "List is empty"))
        ((null? (cdr ls)) (car ls))
        (else (last-pair (cdr ls)))))

(last-pair (list 1 3 4 5)) ;5
