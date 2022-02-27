;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |138|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)
(cons 1 (cons 3 (cons 16 '())))


; List-of-amounts -> PositiveNumber
; computes the sum of the amounts in the given list
(check-expect (sum '()) 0)
(check-expect (sum (cons 5 (cons 4 (cons 1 '())))) 10)
; (define (sum l) 5)
(define (sum l)
  (cond ((empty? l) 0)
        ((cons? l)
         (+ (first l)
            (sum (rest l))))))