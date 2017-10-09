;; converting between bases without using expt
;; by Ivan Galakhov

;;explode function
(define explode (lambda (str)
                  (explodeRecursive (string->list (number->string str)) '())
                  ))
(define explodeRecursive (lambda (strList out)
                           (if (= (length strList) 0)
                               out
                               (explodeRecursive (cdr strList) (append out (list (- (char->integer (car strList)) 48))))
                            )
                           
                           ))
;;convert to base 10
(define convertToTen (lambda (num base)
                       (if (= (length num) 1)
                           (car num)
                           (convertToTen (append (list (+ (cadr num) (* (car num) base)))(cddr num)) base)
                           )
                       ))
;;convert to base n from 10
(define convertToN (lambda (num base)
                     (convertToNRecursive num '() base)
                     ))
(define convertToNRecursive (lambda (num out base)
                              (if (= (quotient num base) 0)
                                  (append (list (modulo num base)) out)
                                  (convertToNRecursive (quotient num base) (append (list (modulo num base)) out) base)
                                  )
                              ))

  
;;actuall function
(define nb (lambda (num ob nb)
             (convertToN (convertToTen (explode num) ob) nb)
             ))

(nb 11111111111111111111 2 10)