;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |038|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; produces a string like the
; given one with the last character removed
; given: "grappa", expect: "grapp"
; (define (string-remove-last string) "grapp")
(define (string-remove-last string)
  (substring string 0 (- (string-length string) 1)))