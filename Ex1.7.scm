 (define (good-enough-alt? guess x)
  (< (abs (- 1 (/ (improve guess x) guess))) 0.001)) 

;If the ratio (New guess/guess) is very close to 1, i.e if our guesses are "stabilized", then sqrt-iter will deem that value good enough.
