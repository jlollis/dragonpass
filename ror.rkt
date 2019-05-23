#lang racket

"Hello World"

(substring "the boy out of the country" 4 7)

(define (extract str)
  (substring str 4 7))

(define lower 1)

(define upper 100)

(define (guess)
  (quotient (+ lower upper) 2))


(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

(guess)

(define (return-five)
  5)

(return-five)

(define (bigger)
  (set! lower (min upper(add1 (guess))))
  (guess))

(bigger)

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(smaller)