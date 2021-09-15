#lang racket

; Calculo del valor absoluto, primera versión.
(define (abs x)
    (cond 
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
    )
)

; Calculo del valor absoluto, segunda versión.
(define (abs x)
    (cond
        ((< x 0) (- x))
        (else x)
    )
)

; Calculo del varlor absoluto, tercera versión
(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)