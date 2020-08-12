(define (square x) (* x x))

(define (square-tree ls)
  (cond ((null? ls) '())
	((not (pair? ls)) (square ls))
	(else (cons (square-tree (car ls)) (square-tree (cdr ls))))))
