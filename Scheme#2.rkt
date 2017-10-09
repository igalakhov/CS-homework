;;Ivan Galakhov
;;Scheme Homework #2

;;1
(define f (lambda (x)
            (if (<= x 3)
                2
                (+ (- (expt x 2) (* x 3)) 8)
                )
            ))
(f 2) ;; should be 2
(f 3) ;; should be 2
(f 4) ;; should be 12

;;2
(define Div23 (lambda (x)
                (or (= (modulo x 3) 0) (= (modulo x 2) 0))
                ))
(Div23 3) ;; should be #t
(Div23 8) ;; should be #t
(Div23 6) ;; should be #t
(Div23 35) ;; should be #f

;;3
(define fred (lambda (me)
               (cond
                 ((< me 0) 0)
                 ((and (>= me 0) (= (modulo me 5) 0)) 5)
                 (else 23)
                )
               
               ))
(fred -3) ;; should be 0
(fred 15) ;; should be 5
(fred 27) ;; should be 23

;;4
(define ToNavyTime (lambda (hour ampm)
                     (if (= ampm 0)
                         (modulo hour 12)
                         (+ (modulo hour 12) 12)
                         )
                     ))
(ToNavyTime 11 0) ;; should be 11
(ToNavyTime 1 1) ;; should be 13
(ToNavyTime 12 0) ;; should be 0
(ToNavyTime 12 1) ;; shuld be 12

;;5
(define BetterNavyTime (lambda (hour ampm)
                         (+ (* (- 1 ampm) (modulo hour 12)) (* ampm (+ (modulo hour 12) 12)))
                         ))
(BetterNavyTime 11 0) ;; should be 11
(BetterNavyTime 1 1) ;; should be 13
(BetterNavyTime 12 0) ;; should be 0
(BetterNavyTime 12 1) ;; shuld be 12

;;6
(define SmallestDivisor (lambda (num)
                          (SDRec num 2)
                          ))
(define SDRec (lambda (num cur)
                (if (= (modulo num cur) 0)
                    cur
                    (SDrec num (+ cur 1))
                    )
                ))
(SmallestDivisor 24) ;; should be 2
(SmallestDivisor 25) ;; should be 5