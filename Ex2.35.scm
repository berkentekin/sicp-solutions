(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(count-leaves (list 1 2 3 4 (list 5 6 (list 7) 8 9) 10)) ; => 10
