;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |142|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; ImageOrFalse is one of:
; – Image
; – #false 

; A PositiveNumber is a Number greater than/equal to 0.

; List-of-images PositiveNumber -> ImageOrFalse
; consumes a list of images loi and a positive number n
; and produces the first image that is not an n by n square
; if it cannot find such an image, it produces #false
(check-expect (ill-sized?
               (cons (square 15 "solid" "black")
                     (cons (square 15 "solid" "green") '()))
               15)
              #false)
(check-expect (ill-sized?
               (cons (square 15 "solid" "black")
                     (cons (rectangle 15 18 "solid" "blue") '()))
               15)
              (rectangle 15 18 "solid" "blue"))
(check-expect (ill-sized? '() 5) #false)
(check-expect (ill-sized?
               (cons (square 15 "solid" "black")
                     (cons (rectangle 15 18 "solid" "blue") '()))
               16)
              (square 15 "solid" "black"))

(define (ill-sized? loi n)
  (cond
    ((empty? loi) #false)
    ((cons? loi)
     (cond
       ((or (not (= (image-width (first loi)) n))
            (not (= (image-height (first loi)) n)))
        (first loi))
        (else (ill-sized? (rest loi) n))))))
