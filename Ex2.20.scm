; I had to (yet again) check existing solutions because I hadn't been able to figure out 
; how to recursively call a function that uses dotted-tail notation. 

; For example, think of a function that adds 1 to the numbers on a list.

#|  
    (define (g . ls)
     (if (null? ls)
     '()
     (cons (+ 1 (car ls)) (g . ??????))))
|#

; Turns out using a helper function was all I had to do 
; (as exemplified in my function below).

(define (same-parity first . restofls)
  (define yes? (if (odd? first) odd? even?))
  (define (g helperls)
    (cond
     ((null? helperls) '())
     ((yes? (car helperls)) (cons (car helperls) (g (cdr helperls))))
     (else (g (cdr helperls)))))
  (cons first (g restofls)))

(same-parity 1 2 3 4 5 6) ; (1 3 5)
(same-parity 2 3 4 5 6) ; (2 4 6)
