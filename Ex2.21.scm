(define (map proc ls)
  (if (null? ls)
      '()
      (cons (proc (car ls)) (map proc (cdr ls)))))

(map (lambda (x) (* x x)) (list 1 2 3 4))
