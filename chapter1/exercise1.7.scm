;exercise 1.7
;The good-enough? procedure used in computing square roots will not be 
;very efficient for finding the square roots of very small numbers. Also, in 
;real computers, arithmetic operations are almost always performed with limited precision.
;This makes our test inadequate for very large numbers. Explain these statements, with examples showing how
;the test fails for small and large numbers. An alternative strategy for implementing good-enough? is 
;to watch how guess changes from one iteration to the next and to stop when the change is a
;very small fraction of the guess. Design a square root procedure that uses this kind of the end test.
;does this work better for small or large numbers?

;The procedure good-enough? is defined as:

; (define (good-enough? guess x)
;  (< (abs (- (square guess) x) 0.001)))

;
;
;The solution we have so far is this thing:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (average x y)
  (/ (+ x y) 2))


(define (abs x) 
  (if (< x 0) (* x -1)
      x))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (improve guess x)
  (average guess (/ x guess)))



(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;Loading this in the scheme interpretor and looking at the results of some
;sqrts of large and small numbers yields this:
;]=> (square (sqrt 1000000000))
;Value: 1000000000.0000161
;
;]=> (square (sqrt 0.000001))
;Value: 9.772285838805523e-4
;Close enough values, but can we do any better?
;supposing we decided to define the good-enough? test as asked by the
;question:

(define (good-enough? guess oldguess)
    (if (< (abs (- oldguess  guess)) 0.001)
	#t
	#f))

;this means that sqrt-iter will have to be changed to:	
(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess) guess
      (sqrt-iter (improve guess x) guess  x)))

;and this will be the change to the sqrt procedure:

(define (sqrt x)
  (sqrt-iter (improve 1.0 x) 1.0 x))
;
;Testing our improved definitions, we get the following values
; ]=> (square (sqrt 1000000))

;Value: 1000000.0000000236

;1 ]=>;
;
;1 ]=> (square (sqrt 0.000001))

;Value: 1.6801126450039938e-6

;1 ]=> 

;Much more accurate values than the simple test we had earlier.

;Note: I think the difference would have been much more when the computers
;were not as sophisticated as they are now.




