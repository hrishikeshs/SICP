;Exercise 1.6
;Alyssa P Hacker doesn't see why `if` needs to be a special form. "Why can't I just define it as an ordinary
;in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new
;version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate (then-clause))
	(else (else-clause))))

;Eva demonstrate the program for Alyssa:

(new-if (= 2 3) 0 5)

;=> 5


(new-if (= 1 1) 0 5)

;=> 0

;Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  (guess)
	  (sqrt-iter (improve guess x) x)))

;What happens when Alyssa attempts to use this to compute square roots? explain.

;Answer: Both the if and the else parts get evaluated when she tries to use the new-if form
;According to the substitution model, when you have a list, the lisp interpreter considers the car of the list to be the 
;procedure that must be applied to the rest of the list. In such a scenario, the rules state that to evaluate an expression, you first evaluate the 
;parts of the expression and then substitute in the body of the procedure the values that are yielded by the evaluation of the parts of the expression.
;This means that the list (new-if (good-enough? guess x) (guess) (sqrt-iter (improve guess x))) will be evaluated such that both the success and the 
;failure branches of the predicate test will be eval'd and the process gets stuck in an infinite loop.





