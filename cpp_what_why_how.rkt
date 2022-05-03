#lang slideshow

(require slideshow/code)
(require pict/shadow)

(define (tt str)
  (text str (cons 'bold (current-code-font)) (current-font-size)))

(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")
(current-gap-size 12)
(current-font-size 28)

(slide
 ;#:title "C++"
 (shadow-frame (text "Programming in C++" null 60))
 (hc-append (bt "Why") (t " and ") (bt "How")))

(slide
 ;#:title "C++"
 (scale (bitmap "redmonk.png") 0.75))

(slide
 (hc-append
  100
  (frame (inset (table 2
         (list
          (t "1") (t "JavaScript")
          (t "2") (t "Python")
          (t "3") (t "Java")
          (t "4") (t "PHP")
          (t "5") (t "C#")
          (t "6") (t "C++")
          (t "7") (t "TypeScript")
          (t "8") (t "Ruby")
          (t "9") (t "C")
          (t "10") (t "Swift"))
         lc-superimpose
         cc-superimpose
         gap-size
         8) gap-size))
  (vc-append (item "test") (item "test2"))))

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
   
