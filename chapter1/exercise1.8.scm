; Newton's method for cube roots is based on the fact that if y is an approximation
; to the cube root of x, then a better approximation is given by the value of
; ( (x/(y^2)) + (2y) ) / (3)
; Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(define (cube-roots-newton x)

  (define limit 0.0001)

  (define (square num)
    (* num num ))
  
  (define (abs num)
    (if (< num 0) (- num)
        num))
  
  (define (generate-better-approximation y)
    (/ (+ (/ x (square y)) (* 2 y))
       3))
  
  (define (cube p)
    (* p (square p)))
  
  (define (good-enough? ans)
    (< (abs (- (cube ans) x)) limit))
  
  (define (cube-root guess)
    (if (good-enough? guess) guess
        (cube-root (generate-better-approximation guess))))
  
  (cube-root (/ x 2)))
