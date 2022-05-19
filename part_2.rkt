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
(current-comment-color (current-id-color)) 

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
 #:name "C++ Defaults are Unsafe"
 (shadow-frame (big (t "C++ Defaults are Unsafe")))
 (scale-to-fit (bitmap "bad_alloc.png") client-w (/ client-h 1.5)))

(slide
 #:name "Default variables are unsafe"
 (shadow-frame (big (t "Default variables are unsafe")))
 (para (bt "Variables are mutable"))
 (para (frame (codeblock-pict
"int myNumber;
std::cin >> myNumber;
int secretNumber = 3;
if (secretNumber = myNumber) printSecretInformation();")))
 (blank 24)
 (para (bt "No buffer overflow check"))
 (para (frame (codeblock-pict #:keep-lang-line? #f
               "#lang ecmascript
std::array<int, 4> a{1, 2, 3, 4};
a[4] = 10;
for (size_t i = 3; i >= 0; --i) doReverse(a[i]);")))
 (blank 24)
 (para (bt "No memory check"))
 (para (frame (codeblock-pict
"MyClass* p = new MyClass;
delete p;
p->getName();"))))

(slide
 #:name "Safe Variables"
 (shadow-frame (big (t "Safe Variables")))
 (para (bt "Declare variables") (tt "const/constexpr"))
 (para (frame (codeblock-pict
"const int myNumber = readNumber();
constexpr int secretNumber = 3;
if (secretNumber = myNumber) printSecretInformation();")))
 (blank 24)
 (para (bt "Use algorithms or range-based for-loops"))
 (para (frame (codeblock-pict
"std::array<int, 4> a{1, 2, 3, 4};
a.back() = 10;
std::for_each(a.crbegin(), a.crend(), 
    [](const auto ai) {doReverse(ai);}")))
 (blank 24)
 (para (bt "Use smart pointers"))
 (para (frame (codeblock-pict
"auto p = std::make_unique<MyClass>;
p->getName();"))))

(slide 
 #:name "Safe Variables"
 (shadow-frame (big (t "Safe Variables")))
 (para (bt "Declare variables") (tt "const/constexpr"))
 (para (frame (codeblock-pict
"const int myNumber = readNumber();
constexpr int secretNumber = 3;
if (secretNumber == myNumber) printSecretInformation();")))
 (blank 24)
 (para (bt "Use algorithms or range-based for-loops"))
 (para (frame (codeblock-pict
"std::array<int, 4> a{1, 2, 3, 4};
a.back() = 10;
std::for_each(a.crbegin(), a.crend(), 
    [](const auto ai) {doReverse(ai);}")))
 (blank 24)
 (para (bt "Use smart pointers"))
 (para (frame (codeblock-pict
"auto p = std::make_unique<MyClass>;
p->getName();"))))

(slide
 #:name "Default functions are unsafe"
 (shadow-frame (big (t "Default functions are unsafe")))
 (para (bt "Functions do mutations"))
 (para (bt "Functions may throw"))
 (para (bt "Functions cannot be evaluated at compile-time"))
 (blank 24)
 (para (frame (codeblock-pict
"class MyClass {
    int _x;
public:
    int getXplus1() {return ++_x;}
};

int square(MyClass& mc) {
    return mc.getXplus1() * mc.getXplus1();
}"))))

(slide
 #:name "Function attributes"
 (shadow-frame (big (t "Function attributes")))
 (para (colorize (tt "const") (current-id-color)) " member-function and references")
 (para (colorize (tt "constexpr") (current-id-color)) " (member-) function")
 (para "(" (colorize (tt "noexcept") (current-id-color)) " (member-) function)")
 (blank 24)
 ;(code-colorize-enabled #f)
 (para (frame (codeblock-pict
"class MyClass {
    int _x;
public:
    constexpr int getXplus1() const noexcept {return _x + 1;}
};

constexpr int square(const MyClass& mc) noexcept {
    return mc.getXplus1() * mc.getXplus1();
}"))))

(slide
 #:name "Safe C++"
 (shadow-frame (big (t "Safe C++")))
 (pitem "Declare variables const(expr)")
 (pitem "Declare (member-)functions const(expr)")
 (blank 24)
 (pitem "Use algorithms, not raw loops")
 (pitem "Use smart pointers, not raw pointers")
 (blank 24)
 (para (colorize (t "✔") "darkgreen") (emph "Use modern C++ features")))


(slide
 #:name "Premature Optimization"
 (shadow-frame (big (t "Premature Optimization")))

 (para (it "Premature optimization is the root of all evil.") "(Donald Knuth)")
 'next
 (blank 24)

 (para (bt "However"))
 (italic (para "In established engineering disciplines a 12% improvement, easily obtained, is never considered marginal; and I believe the same viewpoint should prevail in software engineering."))
(para "(Donald Knuth)"))

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
              "std::array<int, 4> a;
for (size_t i = 0; i < a.size(); ++i) a[i] = 0;
// even better:
std::iota(a.begin(), a.end(), 0));")))

(blank 24)

(para (emph "Less code") (arrow gap-size 0) (emph " Faster code")))

(slide
 #:name "Computer Memory"
 (shadow-frame (big (t "Computer Memory")))
 (scale-to-fit (bitmap "Cache_Hierarchy_Updated.png" ) client-w (/ client-h 1.5)))

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
                        (t "Read Register [~1kB]") (t "1 cycle")
                        (t "Read L1 cache [96kB]") (t "5 cycles")
                        (t "Read L2 cache [1.2MB]") (t "10 cycles")
                        (t "Read L3 cache [12MB]") (t "55 cycles")
                        (t "Read RAM [32GB]") (t "200 cycles"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
 )

(slide
 #:name "Stack and Heap"
 (shadow-frame (big (t "Stack and Heap")))
 (para (emph "Stack memory is basically for free"))
 (pitem "Size known at compile-time")
 (pitem "On register or L1 cache")
 (para (frame (codeblock-pict
               "double x = 4;
constexpr size_t s = 100;
std::array<double, s> a;
MyClass mc; // assuming no heap-allocated member variable")))
 (blank 24)
 (para (emph "Heap memory is expensive"))
 (mitem "Size unknown at compile-time")
 (mitem "Could be on RAM (cache-miss)")
 (para (frame (codeblock-pict
               "std::vector<double> v{1., 2., 3., 4.};
v.push_back(5.);
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
a[index2d(3, 4)] = 5.;"))))

(slide
 #:name "Processor Pipeline"
 (shadow-frame (big (t "Processor Pipeline")))
 (scale-to-fit (bitmap "pipeline.png") client-w (/ client-h 1.5)))


(slide
 #:name "Branching"
 (shadow-frame (big (t "Branching")))
 (mitem "(At least) 4 branches")
 (para (frame (codeblock-pict
               "for (auto other = Base::min; other < Base::max; ++other) {
    if (other == base.base)
        baseLikelihoods[other] = eps.complement();
    else
        baseLikelihoods[other] = (1. / 3) * eps;
}")))
 'next
 (blank 24)
 (pitem "No branching")
 (para (frame (codeblock-pict
               "for (auto other = Base::min; other < Base::max; ++other) {
    baseLikelihoods[other] = (1. / 3) * eps;
}
baseLikelihoods[base.base] = eps.complement();"))))

(slide
 #:name "Performance Considerations"
 (shadow-frame (big (t "Performance Considerations")))
 (pitem "Measure!")
 (blank 24)
 (mitem "Do not micro-optimize")
 (pitem "Less code == Faster code")
 (blank 24)
 (pitem "Avoid heap-allocations")
 (pitem "Avoid indirection")
 (pitem "Avoid branching")
 (blank 24)
 (pitem "Pre-calculate often-used values"))

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

    constexpr int x() const noexcept {return _x;}

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
 (pitem "Use available tools and ressources"))

(slide
 #:name "Compiling"
 (scale-to-fit (bitmap "high_energy_biology.png") (/ client-w 1.2) client-h))
