(define challenge1 (list 1 3 (list 5 7) 9))
(define challenge2 (list (list 7)))
(define challenge3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr challenge1))))) ; 7
(car (car challenge2)) ; 7
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr challenge3)))))))))))) ; 7
