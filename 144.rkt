;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |144|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; sum and how-many also work for a
; NEList-of-temperatures:
; the list is "taken apart" until the procedure
; reaches the empty list

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.

; NEList-of-temperatures -> Number 
; adds up the temperatures on the given list
(check-expect
 (sum (cons 1 (cons 2 (cons 3 '())))) 6)
(check-expect
 (sum (cons 3 '())) 3)
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))

; NEList-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect
 (how-many (cons 1 (cons 2 (cons 3 '())))) 3)
(check-expect
 (how-many (cons 7 '())) 1)
(define (how-many alot)
  (cond
    ((empty? alot) 0)
    (else (+ 1 (how-many (rest alot))))))
