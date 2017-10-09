;;partition
(define partition (lambda (sum len)
                    (if (= len 1)
                        1
                        (sumList (map (lambda (a) (partition (- sum a) (- len 1))) (expandList sum)))
                        )
                    ))

;;expand list (takes an int n and unrolls it to a list of (0 ... n))
(define expandList (lambda (range)
                     (if (= range 0)
                         '(0)
                         (cons range (expandList (- range 1)))
                         )
                     ))
;;sum list
(define sumList (lambda (lst)
                  (if (<= (length lst) 1)
                      (if (= (length lst) 0) 0 (car lst))
                      (sumList (cons (+ (car lst) (cadr lst)) (cddr lst)))
                      )
                  ))
(partition 10 3)