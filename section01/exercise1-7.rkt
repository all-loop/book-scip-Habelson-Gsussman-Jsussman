#lang racket
;--------------------------------------------------------------------------
; EJERCICIO 1.7
; Se mejora el procedimiento "good-enough?" para poder dar respuesta al
; cálculo de raíces cuadradas de números pequeños y grandes. 
;
; En vez de ver cuanto nos acercamos al radicando, nos ocupamos de las
; diferencias en valor que esta teniendo nuestra conjetura. Cuanto menor 
; sean las variaciones del valor entre la conjetura actual y la futura,
; podemos dar fin al cálculo por habernos aproximado en un estimable confiable.
;--------------------------------------------------------------------------

; Cálculo de la raíz de cuadrada de un número x
;	. Uso del método Newton para su cálculo:
; 	1. Conjeturar un número 'y' que suponemos es la raíz cuadrada
;		2. Obtener la fracción entre 'x/y'
;		3. Promediar el resultado de la fración y el valor 'y'
; 	4. Volver al paso 1 con 'y' el resultado de 3, iterar hasta un valor
;			 de aproximación mínimo y deseado.

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
; --> Se compara los cambios entre el actual y futuro valor de guess.
;   Si el cambio es solo una fracción pequeña de guess, es válido que 
;   demos por finalizado el cálculo y asi evitar los limites impuestos
;   por las restricciones de computo.
(define (good-enough? guess x)
	(<
		(abs (- guess (improve guess x)))
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
(sqrt 500000000000)
(sqrt 50000)
(sqrt 5000)
(sqrt 500)
(sqrt 50)
(sqrt 5)
(sqrt 0.5)
(sqrt 0.05)
(sqrt 0.005)
(sqrt 0.0005)
(sqrt 0.00005)