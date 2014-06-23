; Ben Bitdiddle has invented a test to determine whether the given interpreter he is faced with is using
; is using applicative order evaluation or normal-order evaluation. He defines the following procedures

(define (p) (p))

(define (test x y)
  (if (= x 0) 0
      y))

;then he evaluates the expression 

(test 0 (p))

;What behaviour will Ben observe with an interpreter that uses applicative-order evaluation? What behaviour will he 
;observe with an interpreter that uses the normal order evaluation? Explain your answer.

; Answer: In an interpreter that uses the applicative order, Ben finds that it goes into infinite loop as trying to evaluate (p)
; results in the procedure "p" s body being invoked repeatedly. Since the interpreter which uses the applicative
; order tries to evaluate all of its arguments before it tries to evaluate the body of the procedure.
; In an interpreter that uses the normal order, the answer 0 is returned as the computation of what (p) is, is not done because 
; normal order evaluation delays knowing what all the arguments evaluate to for as long as possible. In this case, the else case is 
; never executed and we get back the result as zero.



