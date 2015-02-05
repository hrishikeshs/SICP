;; The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; What are the values of the following expressions?

;; (A 1 10)
;; (A 2 4)
;; (A 3 3)

;;Solution:

;; (A 1 10)
;; ==> (A 0 (A 1 9))
;; ==> (* 2 (A 1 9))
;; ==> (* 2 (A 0 (A 1 8)))
;; ==> (* 2 (*2 (A 1 8)))
;; .......
;; Since y is 8 ahead of 2, (base case) and x becomes zero each time, the answer is 2^8 == 1024


;;(A 2 4)
;; ==> (A 1 (A 2 3))
;; ==> (A 0 (A (A 2 3)))
;; ==> (* 2 (A (A 2 3)))
;; ==> (* 2 (A (A 1 (A 2 2))))
;; ==> (* 2 (A (A 1 (A 1 (A 2 1)))))
;; ==> (* 2 (A (A 1 (A 1 2))))
;; ==> (* 2 (A (A 1 (A 0 (A 1 1)))))
;; ==> (* 2 (A (A 1 (A 0 2))))
;; ==> (* 2 (A (A 1 4)))
;; ==> (* 2 (A (A 0 (A 1 3)))
;; ==> (* 2 (A (* 2 (A 1 3)))) okay, I'm bored, let's ask the interpreter.
;; ....
;; Answer: 65536


;; (A 3 3)
;; ===> 65536
