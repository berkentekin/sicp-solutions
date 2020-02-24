(define (f g) (g 2))
(f f) ; f(g) ==> g(2); so f(f) ==> f(2) ==> 2(2), which doesn't mean anything since "2" is not a function.
