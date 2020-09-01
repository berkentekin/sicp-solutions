(define nil '())
(define (queen col row) (list col row))
(define (col x) (car x))
(define (row x) (cadr x))

(define (contains x list)
        (cond ((null? list) #f)
              ((equal? (car list) x) #t)
              (else (contains x (cdr list)))))

(define (accumulate op initial sequence) (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval beg end) (if (> beg end) nil (cons beg (enumerate-interval (+ beg 1) end))))

(enumerate-interval 1 6)

(define (flatmap proc seq) (accumulate append nil (map proc seq)))

(define empty-board nil)

(define (adjoin-position k new-row rest-of-queens)
  (cons (queen k new-row) rest-of-queens))

(define (safe? k positions)
  (let ((newqueen (car positions))
        (others (cdr positions)))
    (cond
     ((and
       (not (contains (row newqueen) (map row others)))
       (not (contains (- (col newqueen) (row newqueen)) (map (lambda (x) (- (col x) (row x))) others)))
       (not (contains (+ (col newqueen) (row newqueen)) (map (lambda (x) (+ (col x) (row x))) others))))
      #t)
     (else #f))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) 
	   (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position 
		    k
		    new-row 
		    rest-of-queens))
		 (enumerate-interval 
		  1 
		  board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)  
