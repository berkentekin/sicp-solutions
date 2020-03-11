(define (count-leaves ls)
  (cond ((null? ls) 0)
        ((not (pair? ls)) 1)
        (else (+ (count-leaves (car ls)) (count-leaves (cdr ls))))))

(count-leaves (list 1 (list 2 (list 3 4)))) ; 4

; It would take too much time to convert the box and tree notation for the computer and I'm lazy.
; However, in the future I may upload a picture of the solutions.
