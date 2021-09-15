#lang racket

; Cuadrado de un número
(define (square x) (* x x))

; Suma de cuadrados
(define (sum-square x y) 
  (+ (square x) (square y))
)

; Suma cuadrada del mayor de dos números
(define (sum-two-larger a b c)
	(cond
		((and (> a b) (> b c)) (sum-square a b))
		((and (> a b) (> c b)) (sum-square a c))
		(else
			(sum-square 
				b
				(if (> a c) a c)
			)
		)
	)
)