;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |147|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A NEList-of-Booleans is one of:
; - (cons Boolean '())
; - (cons Boolean NEList-of-Booleans)
; interpretation: non-empty lists of Booleans

; NEList-of-Booleans -> Boolean
; determines whether all the Booleans in the list are #true
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #false '())) #false)
(check-expect (all-true (cons #true (cons #false '()))) #false)
(check-expect (all-true (cons #false (cons #true '()))) #false)
(check-expect (all-true (cons #true (cons #true '()))) #true)
(check-expect (all-true (cons #false (cons #false '()))) #false)
(define (all-true neb)
  (cond
    ((empty? (rest neb)) (first neb))
    (else (and (first neb) (all-true (rest neb))))))

; NEList-of-Booleans -> Boolean
; determines whether one of the Booleans in the list is #true
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #true '()))) #true)
(check-expect (one-true (cons #true (cons #true '()))) #true)
(check-expect (one-true (cons #false (cons #false '()))) #false)
(check-expect (one-true (cons #false (cons #false (cons #true '())))) #true)
(define (one-true neb)
  (cond
    ((empty? (rest neb)) (first neb))
    (else (or (first neb) (one-true (rest neb))))))
