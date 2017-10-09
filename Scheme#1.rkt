;1
(+ 3 (/ (+ 7 (/ 16))))
;2a
(modulo (expt 2 12) 13)
;2b
(modulo (expt 5 22) 23)
;2c
(modulo (expt 55 6) 7)
;2d
(modulo (expt 18 42) 43)
;3a
(/ (/ 93e+6 1.86e+5) 60)
;3b
(/ (* 1.86e+5 5280) 1e+9)

;3c 
(define Fred (* 1.86e+5 5280 60 60 24 365))
(define George (+ 1 Fred))
(- Fred George)