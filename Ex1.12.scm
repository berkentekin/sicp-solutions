#|
Our virtual Pascal Triangle looks like this:

row 1:  1
row 2:  1 1
row 3:  1 2 1
row 4:  1 3 3 1
row 5:  1 4 6 4 1
.
.
.
|#

(define (pascal row column)
  (cond ((or (= row column) (= column 1)) 1)
        (else (+ (pascal (- row 1) (- column 1)) (pascal (- row 1) column)))))
