;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |051|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define SQ-SIDE 100)
(define BACKGROUND (empty-scene SQ-SIDE SQ-SIDE))

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLight -> Image
; when needed, big-bang obtains the image of the current 
; state of the world by evaluating (render cw)
(check-expect (render "red") (place-image (circle (/ SQ-SIDE 2) "solid" "red") (/ SQ-SIDE 2) (/ SQ-SIDE 2) BACKGROUND))
(define (render cw)
  (place-image (circle (/ SQ-SIDE 2) "solid" cw) (/ SQ-SIDE 2) (/ SQ-SIDE 2) BACKGROUND))
 
; TrafficLight -> TrafficLight
; for each tick of the clock, big-bang obtains the next 
; state of the world from (clock-tick-handler cw) 
(define (clock-tick-handler cw) (traffic-light-next cw))

; TrafficLight -> TrafficLight
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick clock-tick-handler 5 25]
     [to-draw render]))

(main "red")