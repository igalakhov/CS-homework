;;binary addition
;;by Ivan Galakhov

;;binary addition (assume lst 1 is the bigger number)
(define ba (lambda (lst1 lst2)
             (removeTrailingZeros (mapFromTF (addLists (mapToTF (append '(0) lst1)) (mapToTF (extendList lst2 (+ 1 (- (length lst1) (length lst2))))))))
             ))

;;these functions map to and from a #t #f list
(define mapToTF (lambda (lst)
                  (map (lambda (a) (= a 1)) lst)
                  ))
(define mapFromTF (lambda (lst)
                    (map (lambda (a) (if a 1 0)) lst)
                    ))

;;binary half adder function, returns modulo and carry
(define (xor a b) (and (or a b) (not (and a b))))
(define binaryAdd (lambda (a b carry)
                        (list (xor carry (xor a b)) (or (and a b) (and a carry) (and b carry)))
                        ))
;;list helpers
(define getLast (lambda (lst) (car (reverse lst))))
(define removeLast (lambda (lst) (reverse (cdr (reverse lst)))))
(define extendList (lambda (lst num) (if (= num 0) lst (extendList (append '(0) lst) (- num 1)))))
(define removeTrailingZeros (lambda (lst) (if (not (= (car lst) 0)) lst (removeTrailingZeros (cdr lst)))))

;;actuall addition
(define addLists (lambda (lst1 lst2)
                   (addListsRec lst1 lst2 '() #f)
                   ))

(define addListsRec (lambda (lst1 lst2 out carry)
                      (if (= (length lst1) 0)
                          out
                          (addListsRec (removeLast lst1) (removeLast lst2) (append (list (car (binaryAdd (getLast lst1) (getLast lst2) carry))) out) (getLast (binaryAdd (getLast lst1) (getLast lst2) carry)))
                          )
                   ))
