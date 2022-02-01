;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |005|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define SIDE 100)
(define HEIGHT (sqrt (* 3/4 (* SIDE SIDE))))
(define TRONCO (/ SIDE 6))
(define PUNTO (- (/ SIDE 2) (/ TRONCO 2))) 




(overlay/xy (overlay/xy (triangle SIDE "solid" "green")
            0 (* 0.7 HEIGHT)
            (triangle SIDE "solid" "green"))
            PUNTO (* 1.7 HEIGHT)
            (rectangle TRONCO (/ HEIGHT 2) "solid" "brown"))

