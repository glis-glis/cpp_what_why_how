; Copyright (C) 2022 Andreas Füglistaler
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.

#lang slideshow

(require slideshow/code)
(require pict/shadow)
(require slideshow/text)

(define (tt str)
  (text str (current-code-font) (current-font-size)))

(define (emph str)
  (colorize (bt str) "blue"))

(define (gt str)
  (colorize (t str) "gray"))

(define (pitem str)
  (item #:bullet (colorize (t "✔") "darkgreen") str))

(define (mitem str)
  (item #:bullet (colorize (t "x") "darkred") str))

(define (aitem str)
  (item #:bullet (arrowhead (/ gap-size 2) 0) str))

(define (eitem str)
  (item #:bullet (ghost (arrowhead (/ gap-size 2) 0)) str))

(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")
(current-gap-size 12)
(current-font-size 28)
;(current-comment-color (current-id-color)) 

(slide
 ;#:title "C++"
 #:name "Programming in C++"
 (shadow-frame (big (t "Programming in C++")))
 (hc-append (bt "Why") (t " and ") (bt "How"))
 (bt "Part 2")
 (blank 50)
(emph "Andreas Füglistaler")
 )

(slide
 #:name "Programming in C++"
 (shadow-frame (big (t "Programming in C++")))
 (para (emph "Why"))
 (pitem "Old language, new features")
 (pitem "High performance code")
 (pitem "Reusable code")
 (blank 24)
 (para (emph "How"))
 (pitem "")
 (pitem "")
 (pitem ""))



(slide
 #:name "Variables are unsafe by default"
 (shadow-frame (big (t "Variables are unsafe by default")))
 (table 3
        (list
         (bt "Variables are mutable") (ghost (arrow gap-size 0)) (ghost(t "declare const/constexpr"))
         (bt "No buffer overflow check") (ghost (arrow gap-size 0)) (ghost(t "use algorithm"))
         (bt "No memory check") (ghost (arrow gap-size 0)) (ghost(t "use smart pointers")))
        lc-superimpose
        cc-superimpose
        gap-size
        8))


(slide
 #:name "Make variables safe"
 (shadow-frame (big (t "Make variables safe")))
 (table 3
        (list
         (bt "Variables are mutable") (arrow gap-size 0) (t "declare const/constexpr")
         (bt "No buffer overflow check") (arrow gap-size 0) (t "use algorithm")
         (bt "No memory check") (arrow gap-size 0) (t "use smart pointers"))
        lc-superimpose
        cc-superimpose
        gap-size
        8))

(slide
 #:name "Functions are unsafe by default"
 (shadow-frame (big (t "Functions are unsafe by default")))
 (table 3
        (list
         (bt "Functions mutate references") (ghost (arrow gap-size 0)) (ghost (t "const references"))
         (bt "Member-functions mutate members") (ghost (arrow gap-size 0)) (ghost (t "const"))
         (bt "Functions evaluate at run-time") (ghost (arrow gap-size 0)) (ghost (t "constexpr")))
        lc-superimpose
        cc-superimpose
        gap-size
        8))

(slide
 #:name "Make variables safe"
 (shadow-frame (big (t "Make variables safe")))
 (table 3
        (list
         (bt "Functions mutate references") (arrow gap-size 0) (t "const references")
         (bt "Member-functions mutate members") (arrow gap-size 0) (t "const")
         (bt "Functions evaluate at run-time") (arrow gap-size 0) (t "constexpr"))
        lc-superimpose
        cc-superimpose
        gap-size
        8))


(slide
 #:name "Safe C++"
 (shadow-frame (big (t "Safe C++")))
 (pitem "Declare variables as const")
 (pitem "Declare member-functions as const")
 (pitem "Declare functions as constexpr (if possible)")
 (blank 24)
 (pitem "Use algorithms, not raw loops")
 (pitem "Use objects, not pointers")
 (pitem "Use smart pointers, not raw pointers")
 (blank 24)
 (para (colorize (t "✔") "darkgreen") (emph "Use modern C++ features")))

(slide
 #:name "C++ Defaults are Unsafe"
 (scale-to-fit (bitmap "bad_alloc.png") client-w (/ client-h 1.5)))


(slide
 #:name "Premature Optimization"
 (shadow-frame (big (t "Premature Optimization")))

 (para (it "Premature optimization is the root of all evil.") "(Donald Knuth, 1974)")
 'next
 (blank 24)

 (para (emph "However"))
 (italic (para "In established engineering disciplines a 12% improvement, easily obtained, is never considered marginal; and I believe the same viewpoint should prevail in software engineering."))
(para "(Donald Knuth," (bt " same article") ")"))

(define ccc (current-comment-color))
(current-comment-color (current-id-color)) 
(slide
 #:name "No Micro-Optimization"
 (shadow-frame (big (t "No Micro-Optimization")))

 (mitem "Do not do this:")
(para (frame (codeblock-pict
              "std::array<int, 4> a;
a[0] = 0;
a[1] = 1;
a[2] = 2;
a[3] = 3;")))

(blank 24)
 (pitem "Do this:")
(para (frame (codeblock-pict
              "for (size_t i = 0; i < a.size(); ++i) a[i] = i;")))

 (pitem "Even better:")
(para (frame (codeblock-pict
              "std::iota(a.begin(), a.end(), 0));")))

(blank 24)

(para (emph "Less code") (arrow gap-size 0) (emph " Faster code")))

(slide
 #:name "Computer Memory"
 (shadow-frame (big (t "Computer Memory")))
 (scale-to-fit (bitmap "Cache_Hierarchy_Updated.png" ) client-w (/ client-h 1.5)))
(current-comment-color ccc)

(slide
 #:name "The Cost of Instructions"
 (shadow-frame (big (t "The Cost of Instructions")))
(frame (inset (table 2
                       (list
                        (tt "double + double") (t "1 cycle")
                        (tt "double - double") (t "1 cycle")
                        (tt "double * double") (t "2 cycle")
                        (tt "double / double") (t "36 cycle")
                        (tt "size_t / size_t") (t "59 cycle")
                        (tt "size_t % size_t") (t "60 cycle")
                        (t "") (t "")
                        (t "Read Register [~1kB]") (t "0 cycle")
                        (t "Read L1 cache [192kB]") (t "5 cycles")
                        (t "Read L2 cache [5MB]") (t "10 cycles")
                        (t "Read L3 cache [12MB]") (t "50 cycles")
                        (t "Read RAM [32GB]") (t "200 cycles"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
 )

(slide
 #:name "Stack vs Heap"
 (scale-to-fit (bitmap "stack_heap.png") client-w (/ client-h 1.5)))

(slide
 #:name "Call Stack"
 (shadow-frame (big (t "Call Stack")))
 (scale-to-fit (bitmap "stack.png") client-w (/ client-h 1.3)))

(slide
 #:name "Stack and Heap Variables"
 (shadow-frame (big (t "Stack and Heap Variables")))
 (para (emph "Variables on stack are basically for free"))
 (pitem "Size known at compile-time")
 (pitem "On register or L1 cache")
 (para (frame (codeblock-pict
               "double x = 4;
std::array<double, 1024> a;
MyClass mc; // assuming no heap-allocated members
            // nor virtual functions")))
 (blank 24)
 (para (emph "Variables on heap is expensive"))
 (mitem "Allocation and deallocation costs")
 (mitem "Could be on RAM (cache-miss)")
 (para (frame (codeblock-pict
               "std::vector<double> v{1., 2.};
v.push_back(3.);
auto unique = std::make_unique<MyClass>();
auto shared = std::make_shared<MyClass>();"))))

(slide
 #:name "Indirection"
 (shadow-frame (big (t "Indirection")))
 (mitem "Do not do this:")
 (para (frame (codeblock-pict
               "std::vector<std::vector<double>> a2d; // 2D Matrix
a2d.resize(10);
for(auto& a: a2d) a.resize(10);
a[3][4] = 5.;")))
 (blank 24)
 (pitem "Do this:")
 (para (frame (codeblock-pict
               "size_t index2d(size_t i, size_t j, size_t N) {
    return i*N + j;
}
std::vector<double> a2d; // 2D Matrix
a2d.resize(10*10);
a[index2d(3, 4, 10)] = 5.;"))))

(slide
 #:name "Processor Pipeline"
 (shadow-frame (big (t "Processor Pipeline")))
 (scale-to-fit (bitmap "pipeline.png") client-w (/ client-h 1.5)))


(current-comment-color (current-id-color)) 
(slide
 #:name "Branching"
 (shadow-frame (big (t "Branching")))
 (mitem "(At least) 4 branches")
 (para (frame (codeblock-pict
               "for (auto other = Base::min; other < Base::max; ++other) {
    if (other == base.base)
        baseLikelihoods[other] = eps.complement();
    else
        baseLikelihoods[other] = (1./3) * eps;
}")))
 'next
 (blank 24)
 (pitem "No branching")
 (para (frame (codeblock-pict
               "baseLikelihoods.fill((1./3) * eps);
baseLikelihoods[base.base] = eps.complement();"))))
(current-comment-color ccc) 

(slide
 #:name "Performance Considerations"
 (shadow-frame (big (t "Performance Considerations")))
 (pitem "Measure!")
 (blank 24)
 (mitem "Do not micro-optimize")
 (pitem "Less code ➔ Faster code")
 (blank 24)
 (pitem "Avoid heap-allocations")
 (pitem "Avoid indirection")
 (pitem "Avoid branching"))

(slide
 #:name "Live C++ Example"
 (shadow-frame (big (t "Live C++ Example")))
 (tt "poly.cpp"))

(slide
 #:name "Comix"
 (bitmap "efficiency.png") )

(slide
 #:name "Programming in C++"
 (shadow-frame (big (t "Programming in C++")))
 (para (emph "Why"))
 (pitem "Old language, new features")
 (pitem "High performance code")
 (pitem "Reusable code")
 (blank 24)
 (para (emph "How"))
 (pitem "Safety through modern features")
 (pitem "Be aware of performance costs")
 (pitem "Use available tools and resources"))
