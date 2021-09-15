; Breve explicación del por que deja de funcionar con el uso de new-if
; :
;   . new-if antes de enviar cada uno de sus terminos los evalúa, a diferencia
;     del operador if que es procesado de manera diferente. Esto lo que produce
;     es que nunca tengamos una actualización al constanmente estar llamando
;     sqrt-iter para obtener su valor y asi poder ser evaluado. Finalmente todo
;     resulta en bucle sin término, un callejón sin salida.

;--------------------------------------------------------------------------
; Helpers
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))

; Reescritura del método if.
(define (new-if predicate then-clause else-clause)
    ( cond 
        (predicate then-clause)
        (else else-clause)
    )
)
;--------------------------------------------------------------------------

; Estrategia básica
(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
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