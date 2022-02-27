;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |139|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)

; List-of-numbers -> Boolean
; determines whether all numbers of the given list are positive
(check-expect (pos? '()) #true)
(check-expect (pos? (cons 1 (cons 18 '()))) #true)
(check-expect (pos? (cons -1 (cons 18 '()))) #false)
(check-expect (pos? (cons 1 (cons -18 '()))) #false)
; (define (pos? l) #true)
(define (pos? l)
  (cond ((empty? l) #true)
        ((cons? l) (and (>= (first l) 0)
                        (pos? (rest l))))))

(pos? (cons -1 '()))

; List-of-numbers -> Boolean
; produces the sum of the input if all numbers are positive
(check-expect (checked-sum '()) 0)
(check-expect (checked-sum (cons 3 (cons 2 '()))) 5)
(check-error (checked-sum (cons -3 (cons 2 '()))))
(check-error (checked-sum (cons 3 (cons -2 '()))))
; (define (checked-sum l) 3)
(define (checked-sum l)
  (cond ((empty? l) 0)
        ((cons? l) (cond ((>= (first l) 0) (+ (first l)
                                              (checked-sum (rest l))))
                         (else (error "negative number in the list"))))))
                   
