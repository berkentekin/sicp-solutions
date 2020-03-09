(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)

; Zero can be defined as (define (zero f) (lambda (x) x)) to make substitution easier.
; add-1 zero: (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (lambda (x) x) x)))
(define one (lambda (f) (lambda (x) (f x)))) ;==> This is the function for one.

; add-1 one: (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (lambda (x) (f x)) x)))
(define two (lambda (f) (lambda (x) (f (f x))))) ;==> This is the function for two.
