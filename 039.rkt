;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |039|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WHEEL-RADIUS 5)

(define BODY-LENGTH (* 9 WHEEL-RADIUS))
(define BODY-HEIGHT (* 2 WHEEL-RADIUS))

(define BODY (rectangle BODY-LENGTH BODY-HEIGHT "solid" "red"))
(define TOPBODY (rectangle (/ BODY-LENGTH 2) (/ BODY-HEIGHT 2) "solid" "red"))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))

(define CAR
  (underlay/xy
   (underlay/xy (above TOPBODY BODY) 
                (* 1 WHEEL-RADIUS)
                (* 2 WHEEL-RADIUS)
                WHEEL)
   (* 6 WHEEL-RADIUS)
   (* 2 WHEEL-RADIUS)
   WHEEL)
  )

CAR