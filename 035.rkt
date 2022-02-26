;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |035|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; extracts the last character from the input (non-empty) string
; given: "ciumbia", expect: "a"
; given: "carro", expect: "o"
; (define (string-last string)
;   ("e"))
(define (string-last string)
  (substring string (- (string-length string) 1)))