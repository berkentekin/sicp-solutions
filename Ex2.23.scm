(define (for-each proc ls)
  (cond ((null? ls) (display ""))
        (else
         (proc (car ls))
         (for-each proc (cdr ls)))))
