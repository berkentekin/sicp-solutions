(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (make-segment pstart pend) (cons pstart pend))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-rectangle segment1 segment2) (cons segment1 segment2))
(define (length segment)
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (sqrt (+ (square (- (x-point b) (x-point a))) (square (- (y-point a) (y-point b)))))))

(define (longer a b) (cond ((> (length a) (length b)) a)
                           ((< (length a) (length b)) b)
                           (else (error "The segments are equally long" (length a) (length b)))))
(define (shorter a b) (cond ((< (length a) (length b)) a)
                           ((> (length a) (length b)) b)
                           (else (error "The segments are equally long" (length a) (length b)))))

(define (shortside rect) (shorter (car rect) (cdr rect)))
(define (longside rect) (longer (car rect) (cdr rect)))
(define (perimeter rect) (* 2 (+ (length (shortside rect)) (length (longside rect)))))
(define (area rect) (* (length (shortside rect)) (length (longside rect))))



(perimeter (make-rectangle (make-segment (make-point 2 3) (make-point 4 5)) (make-segment (make-point 3 2) (make-point 2 3))))
