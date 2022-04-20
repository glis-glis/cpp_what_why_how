#lang slideshow

(require slideshow/code)
(require pict/shadow)

(define (tt str)
  (text str (cons 'bold (current-code-font)) (current-font-size)))

(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")
(current-gap-size 18)
;(current-font-size 28)

(slide
 ;#:title "C++"
 (shadow-frame (t "Programming in C++"))
 'next
 (hc-append (bt "Why") (t " and ") (bt "How")))

(slide
 (colorize  (t "Compiled or Interpreted") "darkgreen")
 (blank 36)
 (colorize  (t "Programming paradigms") "darkgreen")
 (blank 36)
 'alts(list
 (list (colorize  (t "Speed, Safety and Comfort") "darkgreen"))
 (list (colorize  (t "Speed, Safety or Comfort") "darkgreen"))))

(slide
 #:title "Interpreted languages"
 #:gap-size 12
 (item "Hardware-independent")
 (subitem #:bullet (t "+") "No compilation step")
 (subitem #:bullet (t "-") "Interpreter must be available")
 (subitem #:bullet (t "-") "Slow execution")
 (blank 24)
 'next
 (item 	 "Sandboxed in interpreter")
 (subitem #:bullet (t "+") "Few security issues")
 (subitem #:bullet (t "-") "Limited hardware access")
 (blank 24)
 'next
 (item "Automatic memory management")
 (subitem #:bullet (t "+") "No segfaults")
 (subitem #:bullet (t "+") "Less boilerplate")
 (subitem #:bullet (t "-") "Can be slow/unpredictable"))

(slide
 #:title "Compiled languages"
 #:gap-size 12
 (item "Hardware-dependend executable")
 (subitem #:bullet (t "+") "Simply runs")
 (subitem #:bullet (t "+") "Fast execution")
 (subitem #:bullet (t "-") "Slow compilation")
 (subitem #:bullet (t "-")  "Undefined behaviour")
 (blank 24)
 'next
 (item "Not sandboxed")
 (subitem #:bullet (t "+") "Access to hardware")
 (subitem #:bullet (t "-") "Security risks")
 (blank 24)
 'next
 (item "Manual memory managment")
 (subitem #:bullet (t "+") "Speed")
 (subitem #:bullet (t "-") "Boilerplate")
 (subitem #:bullet (t "-") "Segfaults"))

(slide
 #:title "Programming Paradigmes"
(hc-append (t "1") (t "2"))
 )

(slide
  #:title "Speed, Safety and Convenience"
  (item "Safety and Convenience (but Slow):")
  (subitem #:bullet (t "") "Python, R, ruby, scheme,...")
  (blank)
  (item "Speed and Convenience (but Unsafe):")
  (subitem #:bullet (t "")  "C, Old C++, PASCAL, FORTRAN...")
  (blank)
  (item "Speed and Safety (but Inconvenient):")
  (subitem #:bullet (t "")  "Rust, haskell, ocaml...")
  (blank)
  'next
  (item "A good (?) mix of all")
  (subitem #:bullet (t "")  "Modern C++, D, Swift, Java, C#"))
   
