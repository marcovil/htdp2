;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |140|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A List-of-booleans is one of: 
; – '()
; – (cons Boolean List-of-booleans)

; List-of-booleans -> Boolean
; determines if all values in the list are true
(check-expect (all-true '()) #true)
(check-expect (all-true (cons #true (cons #true '()))) #true)
(check-expect (all-true (cons #true (cons #false '()))) #false)
(check-expect (all-true (cons #false (cons #true '()))) #false)
; (define (all-true l) #false)
(define (all-true l)
  (cond ((empty? l) #true)
        ((cons? l)
         (and (first l)
              (all-true (rest l))))))

; List-of-booleans -> Boolean
; determines if at least one value in the list is true
(check-expect (one-true '()) #false)
(check-expect (one-true (cons #true (cons #true '()))) #true)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #true '()))) #true)
(check-expect (one-true (cons #false (cons #false '()))) #false)
; (define (one-true l) #false)
(define (one-true l)
  (cond ((empty? l) #false)
        ((cons? l)
         (or (first l)
              (one-true (rest l))))))