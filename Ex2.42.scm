;This exercise was a nightmare, everything went wrong while I was trying to solve it. Even the damn enumerate procedure worked wrongly before I managed to debug it.
;However, solving this was an amazing experience.

;Unlike the template, queens are defined as their row and column numbers, respectively, which is the standard in chess. 
;The reverse procedure used at the end is purely for aesthetic reasons.

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

(for-each (lambda (x)
	    (let ((f (reverse x)))
	      (display f))
	    (newline))
	  (queens 8))
#| 

((1 1) (2 5) (3 8) (4 6) (5 3) (6 7) (7 2) (8 4))
((1 1) (2 6) (3 8) (4 3) (5 7) (6 4) (7 2) (8 5))
((1 1) (2 7) (3 4) (4 6) (5 8) (6 2) (7 5) (8 3))
((1 1) (2 7) (3 5) (4 8) (5 2) (6 4) (7 6) (8 3))
((1 2) (2 4) (3 6) (4 8) (5 3) (6 1) (7 7) (8 5))
((1 2) (2 5) (3 7) (4 1) (5 3) (6 8) (7 6) (8 4))
((1 2) (2 5) (3 7) (4 4) (5 1) (6 8) (7 6) (8 3))
((1 2) (2 6) (3 1) (4 7) (5 4) (6 8) (7 3) (8 5))
((1 2) (2 6) (3 8) (4 3) (5 1) (6 4) (7 7) (8 5))
((1 2) (2 7) (3 3) (4 6) (5 8) (6 5) (7 1) (8 4))
((1 2) (2 7) (3 5) (4 8) (5 1) (6 4) (7 6) (8 3))
((1 2) (2 8) (3 6) (4 1) (5 3) (6 5) (7 7) (8 4))
((1 3) (2 1) (3 7) (4 5) (5 8) (6 2) (7 4) (8 6))
((1 3) (2 5) (3 2) (4 8) (5 1) (6 7) (7 4) (8 6))
((1 3) (2 5) (3 2) (4 8) (5 6) (6 4) (7 7) (8 1))
((1 3) (2 5) (3 7) (4 1) (5 4) (6 2) (7 8) (8 6))
((1 3) (2 5) (3 8) (4 4) (5 1) (6 7) (7 2) (8 6))
((1 3) (2 6) (3 2) (4 5) (5 8) (6 1) (7 7) (8 4))
((1 3) (2 6) (3 2) (4 7) (5 1) (6 4) (7 8) (8 5))
((1 3) (2 6) (3 2) (4 7) (5 5) (6 1) (7 8) (8 4))
((1 3) (2 6) (3 4) (4 1) (5 8) (6 5) (7 7) (8 2))
((1 3) (2 6) (3 4) (4 2) (5 8) (6 5) (7 7) (8 1))
((1 3) (2 6) (3 8) (4 1) (5 4) (6 7) (7 5) (8 2))
((1 3) (2 6) (3 8) (4 1) (5 5) (6 7) (7 2) (8 4))
((1 3) (2 6) (3 8) (4 2) (5 4) (6 1) (7 7) (8 5))
((1 3) (2 7) (3 2) (4 8) (5 5) (6 1) (7 4) (8 6))
((1 3) (2 7) (3 2) (4 8) (5 6) (6 4) (7 1) (8 5))
((1 3) (2 8) (3 4) (4 7) (5 1) (6 6) (7 2) (8 5))
((1 4) (2 1) (3 5) (4 8) (5 2) (6 7) (7 3) (8 6))
((1 4) (2 1) (3 5) (4 8) (5 6) (6 3) (7 7) (8 2))
((1 4) (2 2) (3 5) (4 8) (5 6) (6 1) (7 3) (8 7))
((1 4) (2 2) (3 7) (4 3) (5 6) (6 8) (7 1) (8 5))
((1 4) (2 2) (3 7) (4 3) (5 6) (6 8) (7 5) (8 1))
((1 4) (2 2) (3 7) (4 5) (5 1) (6 8) (7 6) (8 3))
((1 4) (2 2) (3 8) (4 5) (5 7) (6 1) (7 3) (8 6))
((1 4) (2 2) (3 8) (4 6) (5 1) (6 3) (7 5) (8 7))
((1 4) (2 6) (3 1) (4 5) (5 2) (6 8) (7 3) (8 7))
((1 4) (2 6) (3 8) (4 2) (5 7) (6 1) (7 3) (8 5))
((1 4) (2 6) (3 8) (4 3) (5 1) (6 7) (7 5) (8 2))
((1 4) (2 7) (3 1) (4 8) (5 5) (6 2) (7 6) (8 3))
((1 4) (2 7) (3 3) (4 8) (5 2) (6 5) (7 1) (8 6))
((1 4) (2 7) (3 5) (4 2) (5 6) (6 1) (7 3) (8 8))
((1 4) (2 7) (3 5) (4 3) (5 1) (6 6) (7 8) (8 2))
((1 4) (2 8) (3 1) (4 3) (5 6) (6 2) (7 7) (8 5))
((1 4) (2 8) (3 1) (4 5) (5 7) (6 2) (7 6) (8 3))
((1 4) (2 8) (3 5) (4 3) (5 1) (6 7) (7 2) (8 6))
((1 5) (2 1) (3 4) (4 6) (5 8) (6 2) (7 7) (8 3))
((1 5) (2 1) (3 8) (4 4) (5 2) (6 7) (7 3) (8 6))
((1 5) (2 1) (3 8) (4 6) (5 3) (6 7) (7 2) (8 4))
((1 5) (2 2) (3 4) (4 6) (5 8) (6 3) (7 1) (8 7))
((1 5) (2 2) (3 4) (4 7) (5 3) (6 8) (7 6) (8 1))
((1 5) (2 2) (3 6) (4 1) (5 7) (6 4) (7 8) (8 3))
((1 5) (2 2) (3 8) (4 1) (5 4) (6 7) (7 3) (8 6))
((1 5) (2 3) (3 1) (4 6) (5 8) (6 2) (7 4) (8 7))
((1 5) (2 3) (3 1) (4 7) (5 2) (6 8) (7 6) (8 4))
((1 5) (2 3) (3 8) (4 4) (5 7) (6 1) (7 6) (8 2))
((1 5) (2 7) (3 1) (4 3) (5 8) (6 6) (7 4) (8 2))
((1 5) (2 7) (3 1) (4 4) (5 2) (6 8) (7 6) (8 3))
((1 5) (2 7) (3 2) (4 4) (5 8) (6 1) (7 3) (8 6))
((1 5) (2 7) (3 2) (4 6) (5 3) (6 1) (7 4) (8 8))
((1 5) (2 7) (3 2) (4 6) (5 3) (6 1) (7 8) (8 4))
((1 5) (2 7) (3 4) (4 1) (5 3) (6 8) (7 6) (8 2))
((1 5) (2 8) (3 4) (4 1) (5 3) (6 6) (7 2) (8 7))
((1 5) (2 8) (3 4) (4 1) (5 7) (6 2) (7 6) (8 3))
((1 6) (2 1) (3 5) (4 2) (5 8) (6 3) (7 7) (8 4))
((1 6) (2 2) (3 7) (4 1) (5 3) (6 5) (7 8) (8 4))
((1 6) (2 2) (3 7) (4 1) (5 4) (6 8) (7 5) (8 3))
((1 6) (2 3) (3 1) (4 7) (5 5) (6 8) (7 2) (8 4))
((1 6) (2 3) (3 1) (4 8) (5 4) (6 2) (7 7) (8 5))
((1 6) (2 3) (3 1) (4 8) (5 5) (6 2) (7 4) (8 7))
((1 6) (2 3) (3 5) (4 7) (5 1) (6 4) (7 2) (8 8))
((1 6) (2 3) (3 5) (4 8) (5 1) (6 4) (7 2) (8 7))
((1 6) (2 3) (3 7) (4 2) (5 4) (6 8) (7 1) (8 5))
((1 6) (2 3) (3 7) (4 2) (5 8) (6 5) (7 1) (8 4))
((1 6) (2 3) (3 7) (4 4) (5 1) (6 8) (7 2) (8 5))
((1 6) (2 4) (3 1) (4 5) (5 8) (6 2) (7 7) (8 3))
((1 6) (2 4) (3 2) (4 8) (5 5) (6 7) (7 1) (8 3))
((1 6) (2 4) (3 7) (4 1) (5 3) (6 5) (7 2) (8 8))
((1 6) (2 4) (3 7) (4 1) (5 8) (6 2) (7 5) (8 3))
((1 6) (2 8) (3 2) (4 4) (5 1) (6 7) (7 5) (8 3))
((1 7) (2 1) (3 3) (4 8) (5 6) (6 4) (7 2) (8 5))
((1 7) (2 2) (3 4) (4 1) (5 8) (6 5) (7 3) (8 6))
((1 7) (2 2) (3 6) (4 3) (5 1) (6 4) (7 8) (8 5))
((1 7) (2 3) (3 1) (4 6) (5 8) (6 5) (7 2) (8 4))
((1 7) (2 3) (3 8) (4 2) (5 5) (6 1) (7 6) (8 4))
((1 7) (2 4) (3 2) (4 5) (5 8) (6 1) (7 3) (8 6))
((1 7) (2 4) (3 2) (4 8) (5 6) (6 1) (7 3) (8 5))
((1 7) (2 5) (3 3) (4 1) (5 6) (6 8) (7 2) (8 4))
((1 8) (2 2) (3 4) (4 1) (5 7) (6 5) (7 3) (8 6))
((1 8) (2 2) (3 5) (4 3) (5 1) (6 7) (7 4) (8 6))
((1 8) (2 3) (3 1) (4 6) (5 2) (6 5) (7 7) (8 4))
((1 8) (2 4) (3 1) (4 3) (5 6) (6 2) (7 7) (8 5))
|#
