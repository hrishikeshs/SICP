;; The following pattern of numbers is called a Pascal's triangle.
;;               1
;;             1   1     
;;           1   2   1      
;;         1   3   3   1
;;       1   4   6   4   1

;; The numbers at the edge of the triangle are all 1, and each number
;; inside the triangle is the sum of the two numbers above it. Write a
;; procedure that computes elements of the Pascal's triangle by means of a
;; recursive process.

;; Solution

;; level is the depth to which the triangle has to be generated.
;; level = 1 means just the first number 1,
;; level = 2 means: 1, 1, 1
;; level = 3 means: 1, 1, 1, 1, 2, 1
;; and so on.


(define (helper z)
  (if (= (length z) 2) (cons (+ (car z) (cadr z)) (list (cadr z)))
      (list
       (+ (car z) (cadr z))
       (helper (cdr z)))))


(define (sum-interior x)
  (cond ((= (length x) 1) (car x))
        (else
         (helper x))))

(define (sum-list-pascal x)
  (if (not (list? x)) (list x)
      (list (car x) (sum-interior x))))

(define (last x)
  (if (= (length x) 1)
      (if (list? (car x)) (car x)
          x)
      (last (cdr x))))

(define (flatten sequence)
  (cond ((null? sequence) '())
        ((list? (car sequence)) (append (flatten (car sequence))
                                        (flatten (cdr sequence))))
        (else (cons (car sequence) (flatten (cdr sequence))))))


(define (pascals-triangle level)
  (if (= level 1) '(1) ;;base case
      (list (pascals-triangle (- level 1))                                       ;;munge together the pascals-triangle for n-1
            (flatten (sum-list-pascal (last (pascals-triangle (- level 1)))))))) ;;generate the nth row
                                                                                 ;;and make it a simple list(This bothers me a little bit because
                                                                                 ;;flatten should ideally be somewhere else. But I can live with that for now.



                              
