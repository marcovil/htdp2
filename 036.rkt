;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |036|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 (require 2htdp/image)
; Image -> Number
; counts the number of pixels of a given image
; given: (rectangle 40 20 "outline" "black"), expect: 800
; given: (square 40 "solid" "slateblue"), expect: 1600
; (define (image-area image) 107)
(define (image-area image)
  (* (image-width image) (image-height image)))