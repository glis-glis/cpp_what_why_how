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

(define (c++ str)
  (colorize (tt str) "darkblue"))

(define (kw str)
  (colorize (tt str) "darkred"))

(define (// str)
  (colorize (tt str) "darkgreen"))

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

(slide
 #:name "Core Guidelines"
 (shadow-frame (big (t "C++ Core Guidelines")))
 (para "Initiated by Bjarne Stroustrup and Herb Sutter")
 (para (tt "isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines"))
 (blank 24)
 (para (emph "Aims"))
 (pitem "Less error-prone and more maintainable")
 (pitem "Faster/easier initial development")
 (pitem "Zero-overhead principle")
 (pitem "Guidelines, not rules"))

(slide
 #:name "Rule of Zero"
 (shadow-frame (big (t "Rule of Zero")))
 (para (emph "C.20:") " If you can avoid defining default operations, do")
 (blank 24)
 (para (frame (codeblock-pict
               "class MyClass {
    int _x;
public:
    MyClass(int x = 0) : _x(x) {}

    int x() const {return _x;}

    // implicitly creates:
    // ~MyClass() = default;
    // MyClass(const MyClass&) = default;
    // MyClass& operator=(const MyClass&) = default;

    // MyClass(MyClass&&) = default;
    // MyClass& operator=(MyClass&&) = default;
}"))))

(slide
 #:name "Rule of Five"
 (shadow-frame (big (t "Rule of Five")))
 (para (emph "C.21:") " If you define, " (tt "=default") " or " (tt "=delete") "any copy, move, or destructor function, define, " (tt "=default") " or " (tt "=delete") "them all")
 (blank 24)
 (para (frame (codeblock-pict
"class MyClass {
public:
    std::vector<int> xs;
    virtual ~MyClass() = default;

    // implicitly creates:
    // MyClass(const MyClass&) = default;
    // MyClass& operator=(const MyClass&) = default;

    // MyClass(MyClass&&) = delete;
    // MyClass& operator=(MyClass&&) = delete;
}
std::vector<MyClass> mcs; // cannot use std::vector move constructor!"))))

(slide
 #:name "Rule of Five"
 (shadow-frame (big (t "Rule of Five")))
 (para (emph "C.21:") " If you define, " (tt "=default") " or " (tt "=delete") "any copy, move, or destructor function, define, " (tt "=default") " or " (tt "=delete") "them all")
 (blank 24)
 (para (frame (codeblock-pict
"class MyClass {
public:
    std::vector<int> xs;
    virtual ~MyClass() = default;

    // do this:
    MyClass(const MyClass&) = default;
    MyClass& operator=(const MyClass&) = default;

    MyClass& operator=(MyClass&&) = default;
    MyClass(MyClass&&) = default;
}
std::vector<MyClass> mcs;// can use std::vector move constructor"))))

(slide
 #:name "Interface or Re-Use?"
 (shadow-frame (big (t "Interface or Re-Use?")))
 (item #:bullet (emph "C.121:") "If a base class is used as an interface, make it a pure abstract class")
 (blank 24)

 (item #:bullet (emph "C.129:")"When designing a class hierarchy, distinguish  between implementation inheritance and interface inheritance")
 (blank 24)

 (item #:bullet (emph "C.133:") "Avoid protected data"))

(slide
 #:name "Controversial?"
 (shadow-frame (big (t "Controversial?")))
 (item #:bullet (emph "C.4:") "Make a function a member only if it needs direct access to the representation of a class")
 (blank 24)
 (para (emph "Reason"))
 (pitem "Less coupling than with member functions")
 (pitem "Fewer functions that can cause trouble by modifying object state")
 (pitem "Reduces the number of functions that needs to be modified after a change in representation")
 (blank 24)
 (para (emph "Problem")
 (mitem "How to know the function exists?")
 (mitem "No auto-complete")))
