;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |134|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String List-of-String -> Boolean
; determines whether the given string is contained in the given list
(check-expect (contains? "grappa" '()) #false)
(check-expect (contains? "grappa" (cons "chiodi" (cons "grappa" '()))) #true)
(check-expect (contains? "pizza" (cons "asfalto" (cons "grappa" '()))) #false)
; (define (contains? string alos) #false)
(define (contains? string alos)
  (cond ((empty? alos) #false)
        ((cons? alos)
         (or (string=? (first alos) string)
             (contains? string (rest alos)))))) 