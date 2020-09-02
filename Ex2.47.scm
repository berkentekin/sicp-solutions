(define (make-frame-met1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-select-met1 frame) (car frame))
(define (edge1-select-met1 frame) (cadr frame))
(define (edge2-select-met1) (caddr frame))


(define (make-frame-met2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-select-met2 frame) (car frame))
(define (edge1-select-met2 frame) (cadr frame))
(define (edge2-select-met2 frame) (cddr frame))
