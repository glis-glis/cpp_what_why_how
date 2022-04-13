#lang slideshow

(require slideshow/code)

(define (tt str)
   (text str (cons 'bold (current-code-font)) (current-font-size)))

(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")

(slide
 #:title "C++"
 
 'alts
 (list (list (item (bt "What?"))
 (item (bt "Why?"))
 (item (bt "How?")))
   
 (list (para (bt "What") "is it")
 (para (bt "Why") "use it")
 (para (bt "How") "to use it"))))

(slide
 #:title "Next"
 (t "huhu") (tt "gaga")
 (code mono)
 )
