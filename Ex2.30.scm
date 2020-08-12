(define (square x) (* x x))

(define (square-tree tr)
  (cond ((null? tr) '())
	((not (pair? tr)) (square tr))
	(else (cons (square-tree (car tr)) (square-tree (cdr tr))))))
