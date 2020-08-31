(define (enumerate-interval beg end)
  (if (> beg end) nil (cons beg (enumerate-interval (1+ beg) end))))

(define (unique-pairs n)
  (accumulate append nil
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n))))

(define (prime? x)
  (define (helper beg) (cond ((> (* beg beg) x) #t)
			     ((= (remainder x beg) 0) #f)
			     (else (helper (+ beg 1)))))
  (helper 2))



(define (prime-sum-pairs n)
  (define (prime-sum? p) (prime? (+ (car p) (cadr p))))
  (define (make-pair-sum pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)
