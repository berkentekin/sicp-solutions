(define (square x) (* x x))

(define (tree-map f tr)
  (cond ((null? tr) '())
	((not (pair? tr)) (f tr))
	(else (cons (tree-map f (car tr)) (tree-map f (cdr tr))))))
