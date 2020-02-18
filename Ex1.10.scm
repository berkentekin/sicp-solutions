;The definition of Ackermann Function in the book seems incorrect, so I'll stick to the definition on Wikipedia instead.

(define (A m n)
  (cond ((= m 0) (+ n 1))
        ((and (> m 0) (= n 0)) (A (- m 1) 1))
        ((and (> m 0) (> n 0)) (A (- m 1) (A m (- n 1))))))

;(define (f n) (A 0 n)) --> It increases n by 1 since (cond ((= m 0) (+ n 1))

;(define (g n) (A 1 n)) --> It increases n by 2. The function A(1,y), where y=/=0, is equal to A(0,A(1,y-1))=A(0,A(1,y-2))=...=A(0,A(0,A(0,A(...,A(1,0))))). This functions calls itself n + 1 times (for all values of n, including 0). After that, the innermost function A(1,0) turns into A(0,1), which yields 2. Since A(0,x) yields (x + 1), our value gets increased n more times, finally yielding (2 + n).

;(define (h n) (A 2 n)) --> yields (2n+3), though I have no idea why. I'll attempt to uncover it later. 
