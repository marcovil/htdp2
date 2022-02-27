;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |041|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

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

(define Y-CAR (- (* 8 WHEEL-RADIUS) (/ (image-height CAR) 2)))

(define BACKGROUND (rectangle (* 100 WHEEL-RADIUS)
                              (* 8 WHEEL-RADIUS)
                              "outline"
                              "black"))

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car
 
; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock cw)
  (+ cw 3))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render cw)
  (place-image CAR cw Y-CAR BACKGROUND))

; WorldState -> Boolean
; true when the car has disappeared on the right side 
(define (end? cw) (> (- cw (/ (image-width CAR) 2))
                        (image-width BACKGROUND)))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))