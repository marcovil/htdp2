;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |009|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define in #false)

(cond ((string? in) (string-length in))
      ((image? in) (* (image-width in) (image-height in)))
      ((number? in) (abs in))
      ((boolean? in) (if in
                         10
                         20)))
      
                         
