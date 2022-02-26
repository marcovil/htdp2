;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |030|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define ATTENDANCE-AT-FIVE-DOLLARS 120)
(define STARTING-PRICE 5.00)
(define CHANGE (/ 15 0.1))
(define FIXED-COST 0)
(define PER-ATTENDEE-COST 1.50)

(define (attendees ticket-price)
  (- ATTENDANCE-AT-FIVE-DOLLARS (* (- ticket-price STARTING-PRICE) CHANGE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* PER-ATTENDEE-COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)