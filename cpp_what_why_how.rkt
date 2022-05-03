#lang slideshow

(require slideshow/code)
(require pict/shadow)
(require slideshow/text)

(define (tt str)
  (text str (cons 'bold (current-code-font)) (current-font-size)))

(define (rt str)
  (colorize (bt str) "red"))


(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")
(current-gap-size 12)
(current-font-size 28)

(slide
 ;#:title "C++"
 (shadow-frame (big (t "Programming in C++")))
 (hc-append (bt "Why") (t " and ") (bt "How")))

(slide
 ;#:title "C++"
 (scale-to-fit (bitmap "redmonk.png") client-w client-h))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
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
  (ghost(para #:width 0.5 (bt"Interpreted")
        (subitem #:bullet (t "+") "No compilation step")
        (subitem #:bullet (t "-") "Interpreter must be available")
        (blank 24)
        (subitem #:bullet (t "+") "Fast development")
        (subitem #:bullet (t "-") "Slow execution")
        (blank 24)
        (subitem #:bullet (t "+") "Few security issues")
        (subitem #:bullet (t "-") "Limited hardware access")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic memory management")
        (subitem #:bullet (t "-") "Slow/unpredictable")
        ))))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (rt "1") (rt "JavaScript")
                        (rt "2") (rt "Python")
                        (t "3") (t "Java")
                        (rt "4") (rt "PHP")
                        (t "5") (t "C#")
                        (t "6") (t "C++")
                        (rt "7") (rt "TypeScript")
                        (rt "8") (rt "Ruby")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Interpreted")
        (subitem #:bullet (t "+") "No compilation step")
        (subitem #:bullet (t "-") "Interpreter must be available")
        (blank 24)
        (subitem #:bullet (t "+") "Fast development")
        (subitem #:bullet (t "-") "Slow execution")
        (blank 24)
        (subitem #:bullet (t "+") "Few security issues")
        (subitem #:bullet (t "-") "Limited hardware access")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic memory management")
        (subitem #:bullet (t "-") "Slow/unpredictable"))
        ))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (t "3") (t "Java")
                        (t "5") (t "C#")
                        (t "6") (t "C++")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (ghost(para #:width 0.5 (bt"Compile to VM")
        (subitem #:bullet (t "+") "Compile once, run everywhere")
        (subitem #:bullet (t "-") "Limited hardware optimization")
        (blank 24)
        (subitem #:bullet (t "+") "Reasonable fast code")
        (subitem #:bullet (t "-") "Slow compilation")
        (blank 24)
        (subitem #:bullet (t "+") "Few security issues")
        (subitem #:bullet (t "-") "Limited hardware access")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic memory management")
        (subitem #:bullet (t "-") "Slow/unpredictable")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic buffer overflow")
        (subitem #:bullet (t "-") "Slow(ish)")
        ))))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (rt "3") (rt "Java")
                        (rt "5") (rt "C#")
                        (t "6") (t "C++")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt"Compile to VM")
        (subitem #:bullet (t "+") "Compile once, run everywhere")
        (subitem #:bullet (t "-") "Limited hardware optimization")
        (blank 24)
        (subitem #:bullet (t "+") "Reasonable fast code")
        (subitem #:bullet (t "-") "Slow compilation")
        (blank 24)
        (subitem #:bullet (t "+") "Few security issues")
        (subitem #:bullet (t "-") "Limited hardware access")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic memory management")
        (subitem #:bullet (t "-") "Slow/unpredictable")
        (blank 24)
        (subitem #:bullet (t "+") "Automatic buffer overflow")
        (subitem #:bullet (t "-") "Slow(ish)")
        (blank 24)
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (t "6") (t "C++")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (ghost(para #:width 0.5 (rt "Procedural programming")
        (subitem #:bullet (t "+") "No hidden costs")
        (subitem #:bullet (t "-") "No hidden safety-nets")
        (blank 24)
        (subitem #:bullet (t "+") "Few language constructs")
        (subitem #:bullet (t "-") "No code reuse (generics, inheritance, ...)")
        (blank 24)
        (subitem #:bullet (t "+") "Manual memory management")
        (subitem #:bullet (t "-") "Prone to errors")
        (blank 24)
        (subitem #:bullet (t "+") "Manual buffer overflow")
        (subitem #:bullet (t "-") "Prone to errors")
        (blank 24)
        (subitem #:bullet (t "+") "Favored by the best (Torwalds, Thompson)")
        (subitem #:bullet (t "-") "Too dangerous/impractical for mere mortals")
        ))))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (t "6") (t "C++")
                        (rt "9") (rt "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Procedural programming")
        (subitem #:bullet (t "+") "No hidden costs")
        (subitem #:bullet (t "-") "No hidden safety-nets")
        (blank 24)
        (subitem #:bullet (t "+") "Few language constructs")
        (subitem #:bullet (t "-") "No code reuse (generics, inheritance, ...)")
        (blank 24)
        (subitem #:bullet (t "+") "Manual memory management")
        (subitem #:bullet (t "-") "Prone to errors")
        (blank 24)
        (subitem #:bullet (t "+") "Manual buffer overflow")
        (subitem #:bullet (t "-") "Prone to errors")
        (blank 24)
        (subitem #:bullet (t "+") "Favored by the best (Torwalds, Thompson)")
        (subitem #:bullet (t "-") "Too dangerous/impractical for mere mortals")
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (rt "6") (rt "C++")
                        (rt "9") (rt "Swift")
                        (rt "19") (rt "Rust")
                        (rt "??") (rt "D")
                        (rt "??") (rt "Nim")
                        (rt "??") (rt "Zig")
                        (rt "??") (rt "Pony")
                        (rt "??") (rt "Zig"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Modern Compiled Language")
        (subitem #:bullet (t "+") "Multi-Paradigm")
        (subitem #:bullet (t "-") "Complicated language")
        (blank 24)
        (subitem #:bullet (t "+") "Manual + Automatic memory management")
        (subitem #:bullet (t "-") "Boilerplate and Runtime cost")
        (blank 24)
        (subitem #:bullet (t "+") "New Languages")
        (subitem #:bullet (t "-") "")
        )))

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
   
