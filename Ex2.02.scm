(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (make-segment pstart pend) (cons pstart pend))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint segment)
  (define (average a b) (/ (+ a b) 2.0))
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (make-point (average (x-point a) (x-point b))
                (average (y-point a) (y-point b))))) 

; In my original solution I hadn't made use of the "average" procedure or the "let" function,
; but I realized that my laziness made the code harder to read when I looked at the solutions on the internet,
; so I "cheated" and changed my solution.
