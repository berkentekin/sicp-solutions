(define (map proc ls)
  (if (null? ls)
      '()
      (cons (proc (car ls)) (map proc (cdr ls)))))

(define (square-list items)
  (if (null? items)
      '()
      (cons
       ((lambda (x) (* x x)) (car items)) (square-list (cdr items)))))

(define (square-map-list items)
  (map
   (lambda (x) (* x x)) items))
