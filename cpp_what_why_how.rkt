#lang slideshow

(require slideshow/code)
(require pict/shadow)
(require slideshow/text)

(define (tt str)
  (text str (cons 'bold (current-code-font)) (current-font-size)))

(define (rt str)
  (colorize (bt str) "red"))

(define (gt str)
  (colorize (t str) "gray"))

(define (pitem str)
  (item #:bullet (colorize (t "✔") "darkgreen") str))

(define (mitem str)
  (item #:bullet (colorize (t "x") "darkred") str))

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
        (pitem "No compilation step")
        (mitem "Interpreter must be available")
        (blank 24)
        (pitem "Fast development")
        (mitem "Slow execution")
        (blank 24)
        (pitem "Few security issues")
        (mitem "Limited hardware access")
        (blank 24)
        (pitem "Automatic memory management")
        (pitem "Buffer overflow check")
        (mitem "Slow/unpredictable")
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (gt "1") (gt "JavaScript")
                        (gt "2") (gt "Python")
                        (rt "3") (rt "Java")
                        (gt "4") (gt "PHP")
                        (rt "5") (rt "C#")
                        (t "6") (t "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt"Compile to VM")
        (pitem "Compile once, run everywhere")
        (mitem "Limited hardware optimization")
        (blank 24)
        (pitem "Reasonable fast code")
        (mitem "Slow compilation")
        (blank 24)
        (pitem "Few security issues")
        (mitem "Limited hardware access")
        (blank 24)
        (pitem "Automatic memory management")
        (pitem "Buffer overflow check")
        (mitem "Slow/unpredictable")
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (gt "1") (gt "JavaScript")
                        (gt "2") (gt "Python")
                        (gt "3") (gt "Java")
                        (gt "4") (gt "PHP")
                        (gt "5") (gt "C#")
                        (t "6") (t "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (rt "9") (rt "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Procedural programming")
        (pitem "No hidden costs")
        (mitem "No hidden safety-nets")
        (blank 24)
        (pitem "Few language constructs")
        (mitem "No code reuse (generics, inheritance, ...)")
        (blank 24)
        (pitem "Fast memory and buffer management")
        (mitem "Prone to errors")
        (blank 24)
        (pitem "Favored by the best (Torwalds, Thompson)")
        (mitem "Too dangerous for mere mortals")
        (ghost (mitem "youhoo"))
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (gt "1") (gt "JavaScript")
                        (gt "2") (gt "Python")
                        (gt "3") (gt "Java")
                        (gt "4") (gt "PHP")
                        (gt "5") (gt "C#")
                        (t "6") (t "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (gt "9") (gt "C")
                        (rt "10") (rt "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Modern Systems Languages")
        (t "There are many (Rust, go, D, Nim, Zig, Pony, ...)")
        (blank 24)
        (pitem "Learned from past errors")
        (pitem "Fast compilation")
        (mitem "Will it still exist in 10 years?")
        (blank 24)
        (pitem "Memory and overflow strategy")
        (mitem "Either Boilerplate or Runtime cost")
        (blank 24)
        (item #:bullet (arrowhead (/ gap-size 2) 0) "Single- or Multi-Paradigm")
        (item #:bullet (arrowhead (/ gap-size 2) 0) "Lots or no hidden costs")
        (item #:bullet (arrowhead (/ gap-size 2) 0) "Flexible or static")
        )))

(slide
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (gt "1") (gt "JavaScript")
                        (gt "2") (gt "Python")
                        (gt "3") (gt "Java")
                        (gt "4") (gt "PHP")
                        (gt "5") (gt "C#")
                        (rt "6") (rt "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (gt "9") (gt "C")
                        (gt "10") (gt "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (rt "Legacy Systems Programming")
        (pitem "Adopts/steals successful features")
        (mitem "Slow compilation due to header files")
        (mitem "Lots of legacy features")
        (blank 24)
        (pitem "Multi-paradigms")
        (mitem "Complicated language")
        (blank 24)
        (pitem "Zero-Cost abstractions")
        (mitem "Mostly a sales pitch")
        (blank 24)
        (pitem "Different memory and overflow strategies")
        (mitem "Default ist manual")
        )))
(slide
 (shadow-frame (big (t "Why C++")))
 (para "Runtime Speed" (colorize (t "≫") "darkred") "Development Speed")
 (para "Runtime Speed" (colorize (t "≫") "darkred") "Safety")
 (blank 24)
 (pitem "Scales well in code- and team-size")
 (pitem "Abstractions to fit the problem")
 (pitem "Modern Paradigms")
 )

   
