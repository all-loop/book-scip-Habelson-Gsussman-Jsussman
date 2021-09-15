#lang racket

; Cálculo de la raíz de cúbica de un número x
;	. Uso del método Newton para su cálculo:
; 	1. Conjeturar un número 'y' que suponemos es la raíz cúbica
; 	2. Si es lo suficientemente buena, ir al último paso. Sino, continuar.
;		3. Obtener la fracción entre '( (x/y^2) + 2y) / 3'
; 	4. Hacer que 'y' sea el valor de la fracción, y volver al paso 1.
;		5. 'y' contiene un valor aproximado de la ráiz cúbica de x


;--------------------------------------------------------------------------
; Helpers
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
(define (multiplicar x n) (* x n))
;--------------------------------------------------------------------------

; Estrategia básica
(define (cubert-iter guess x)
	(if (good-enough? guess x)
		guess
		(cubert-iter (improve guess x) x)
	)
)

; Mejora de la búsqueda (conjetura)
(define (improve guess x)
	(formula 
		(/ x (square guess)) 
		(multiplicar guess 2)
	)
)

; Fórmula dada en el libro
(define (formula x y) (/ (+ x y) 3))

; Mejorar la conjetura hasta que sea lo suficientemente buena
; tolerancia de un 0.001
(define (good-enough? guess x)
	(<
		(abs (- (improve guess x) guess))
		0.001
	)
)

; Cálculo de la raíz cúbica
(define (cubert x)
	(cubert-iter 1.0 x)
)

;--------------------------------------------------------------------------
; Algunos Test
;--------------------------------------------------------------------------
(cubert 27)
(cubert 107)
(cubert 1)
(cubert 1000)