;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |043|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(define BACKGROUND (rectangle (* 70 WHEEL-RADIUS)
                              (* 8 WHEEL-RADIUS)
                              "outline"
                              "black"))


; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

; AnimationState -> AnimationState
; computes the next state of the world
(define (tock as) (+ as 1))

; AnimationState -> Image
; computes the Image of the current state of the world
(define (render as) (place-image CAR (* 3 as) (- (+ Y-CAR (* WHEEL-RADIUS (sin (/ as 2)))) WHEEL-RADIUS) BACKGROUND))

; AnimationState -> Boolean
; true when the car has disappeared on the right side 
(define (end? as) (> (- (* 3 as) (image-width CAR))
                        (image-width BACKGROUND)))

; AnimationState -> AnimationState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))