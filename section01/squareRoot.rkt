#lang racket

; Cálculo de la raíz de cuadrada de un número x
;	. Uso del método Newton para su cálculo:
; 	1. Conjeturar un número 'y' que suponemos es la raíz cuadrada
; 	2. Si es lo suficientemente buena, ir al último paso. Sino, continuar.
;	2. Obtener el promedio de ( y + (x/y)) / 2
;	3. Promediar el resultado de la fración y el valor 'y'
;   4. Hacer que 'y' tenga como valor el promedio obtenido en el paso 3. Luego, volver
;      al paso 1.
; 	5. 'y' contiene un valor aproximado de la ráiz cuadrada de x

;--------------------------------------------------------------------------
; Helpers
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
;--------------------------------------------------------------------------

; Estrategia básica
(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)
	)
)

; Mejora de la búsqueda
(define (improve guess x)
	(average guess (/ x guess))
)

; Promedio
(define (average x y) (/ (+ x y) 2))

; Mejorar la conjetura hasta que sea lo suficientemente buena
; tolerancia de un 0.001
(define (good-enough? guess x)
	(<
		(abs (- (square guess) x))
		0.001
	)
)

; Cálculo de la raíz cuadrada
(define (sqrt x)
	(sqrt-iter 1.0 x)
)

;--------------------------------------------------------------------------
; Algunos Test
;--------------------------------------------------------------------------

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))