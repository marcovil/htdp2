;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |034|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; extracts the first character from the input string
; given: "ciao", expect: "c"
; given: "ostia", expect: "o"
; (define (string-first string) "b")
(define (string-first string)
  (substring string 0 1))