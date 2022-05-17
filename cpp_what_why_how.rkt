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
 (blank 50)
(emph "Andreas Füglistaler")
 )

(slide
 ;#:title "C++"
 #:name "redmonk"
 (scale-to-fit (bitmap "redmonk.png") client-w client-h))

(slide
 #:name "Top 10 Programming Languages"
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
  (ghost(para #:width 0.5 (emph "Interpreted")
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
              ))))

(slide
 #:name "Interpreted"
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (emph "1") (emph "JavaScript")
                        (emph "2") (emph "Python")
                        (t "3") (t "Java")
                        (emph "4") (emph "PHP")
                        (t "5") (t "C#")
                        (t "6") (t "C++")
                        (emph "7") (emph "TypeScript")
                        (emph "8") (emph "Ruby")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (emph "Interpreted")
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
 #:name "VM"
 (shadow-frame (big (t "Top 10 Programming Languages")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (gt "1") (gt "JavaScript")
                        (gt "2") (gt "Python")
                        (emph "3") (emph "Java")
                        (gt "4") (gt "PHP")
                        (emph "5") (emph "C#")
                        (t "6") (t "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (t "9") (t "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (emph"Compile to VM")
        (pitem "Compile once, run everywhere")
        (mitem "Limited hardware optimization")
        (blank 24)
        (pitem "Few security issues")
        (mitem "Limited hardware access")
        (blank 24)
        (pitem "Automatic memory management")
        (pitem "Buffer overflow check")
        (mitem "Slow/unpredictable")
        (blank 24)
        (aitem "Reasonable fast code")
        (aitem "Reasonable fast compilation")
        )))

(slide
 #:name "Procedural"
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
                        (emph "9") (emph "C")
                        (t "10") (t "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (emph "Procedural programming")
        (pitem "No hidden costs")
        (mitem "No hidden safety-nets")
        (blank 24)
        (pitem "Few language constructs")
        (mitem "No code reuse (generics, inheritance)")
        (blank 24)
        (pitem "Fast memory and buffer management")
        (mitem "Prone to errors")
        (blank 24)
        (pitem "Favored by the best (Torwalds, Thompson)")
        (mitem "Too dangerous for mere mortals")
        (ghost (mitem "youhoo"))
        )))

(slide
 #:name "Modern Systems"
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
                        (emph "10") (emph "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (emph "Modern Systems Languages")
        (t "There are many (Rust, Go, D, Nim, Zig, Pony)")
        (blank 24)
        (pitem "Learned from past errors")
        (pitem "Fast compilation")
        (mitem "Will it still exist in 10 years?")
        (blank 24)
        (pitem "Memory and overflow strategy")
        (mitem "Either Boilerplate or Runtime cost")
        (blank 24)
        (aitem "Single- or Multi-Paradigm")
        (aitem "Lots or no hidden costs")
        (aitem "Flexible or static")
        )))

(slide
 #:name "Legacy Systems"
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
                        (emph "6") (emph "C++")
                        (gt "7") (gt "TypeScript")
                        (gt "8") (gt "Ruby")
                        (gt "9") (gt "C")
                        (gt "10") (gt "Swift"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (para #:width 0.5 (emph "Legacy Systems Programming")
        (pitem "Adopts/steals successful features")
        (mitem "Slow compilation due to header files")
        (mitem "Lots of non-orthogonal features")
        (blank 24)
        (pitem "Multi-paradigms")
        (mitem "Complicated language")
        (blank 24)
        (pitem "Zero-Cost abstractions")
        (mitem "Mostly a sales pitch")
        (blank 24)
        (pitem "Different memory and overflow strategies")
        (mitem "Default is manual")
        )))

(slide
 #:name "Future"
 (shadow-frame (big (t "Future")))
 (para (it "It's difficult to make predictions, especially about the future"))
 (blank 24)
 (para (emph "Use two languages"))
 (aitem "Python/R/Lua/Scheme for convenience")
 (aitem "Rewrite the slowest part in C/C++/FORTRAN")
 (aitem "numpy, PyTorch, TensorFlow, LAMMPS, pyRosetta")
 (blank 24)
 (para (emph "Solving the \"Two-language problem\""))
 (aitem "Fast compilation:")
 (eitem "Swift, D, Go")
 (aitem "Fast interpretation (JIT):")
 (eitem "Julia, PyPy, luaJIT"))

(slide
 #:name "Why C++"
 (shadow-frame (big (t "Why C++")))
 (para "Runtime Speed" (colorize (tt "≫") "darkred") "Development Speed")
 (para "Runtime Speed" (colorize (tt "≈") "darkred") "Safety")
 (para "Runtime Speed" (colorize (tt "≪") "darkred") "Scalability")
 (blank 24)
 (pitem "Industrial standard")
 (pitem "Scales well in code- and team-size")
 (pitem "Modern Paradigms"))

(slide
 #:name "Live C++ Example"
 (shadow-frame (big (t "Live C++ Example"))))

(slide
 #:name "C++ Tools"
 (shadow-frame (big (t "C++ Tools")))
 (para (emph "Compiler"))
 (eitem "gcc, clang, VC++")
 (pitem "Warnings are your friends")
 (blank 24)
 (para (emph "IDE"))
 (item #:bullet (tt "🖰") "CLion, Eclipse, Visual Studio Code")
 (item #:bullet (tt "⌨") "emacs, vim")
 (blank 12)
 (pitem "Find files, grep in project")
 (pitem "On the fly compile errors")
 (pitem "Goto definition/declaration, find references")
 (pitem "Code formation, auto-complete"))

(slide
 #:name "C++ Ressources"
 (shadow-frame (big (t "C++ Resources")))
 (para (tt "cppreference.com"))
 (para (tt "godbolt.org"))
 (blank 24)
 (hc-append 10
  (scale-to-fit (bitmap "practice_programming.jpg") (/ client-w 3) (/ client-h 3))
  (scale-to-fit (bitmap "effective_cpp.jpg") (/ client-w 3) (/ client-h 3))
  (scale-to-fit (bitmap "effective_modern.jpg") (/ client-w 3) (/ client-h 3))))

(slide
 #:name "C++ Talks"
 (shadow-frame (big (t "C++ Talks")))
 (para (tt "https://www.youtube.com/user/CppCon"))
 (para (tt "https://www.youtube.com/c/NDCConferences"))
 (blank 24)
 (para (emph "Philosophy:") "Bjarne Stroustrup, Herb Sutter")
 (para (emph "Basics:") "Scott Meyers, Jason Turner, Kate Gregory")
 (para (emph "Advanced:") "Andrei Alexandrescu, Chandler Carruth"))


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
 #:name "The C++ Defaults are Wrong"
 (shadow-frame (big (t "The C++ Defaults are Wrong"))))

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
 (para (colorize (tt "noexcept") (current-id-color)) " (member-) function")
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
 (aitem "Use modern C++ features")
 )

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
constexpr size_t s = 100; // even cheaper
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
 #:name "Processor Pipeline"
 (shadow-frame (big (t "Processor Pipeline")))
 (scale-to-fit (bitmap "pipeline.png") client-w (/ client-h 1.5)))


(slide
 #:name "Branching"
 (shadow-frame (big (t "Branching")))
 (para (frame (codeblock-pict
               "for (auto other = Base::min; other < Base::max; ++other) {
    if (other == base.base)
        baseLikelihoods[other] = eps.complement();
    else
        baseLikelihoods[other] = (1. / 3) * eps;
}"))))

(slide
 (shadow-frame (big (t "Branching")))
 (para (frame (codeblock-pict
               "for (auto other = Base::min; other < Base::max; ++other) {
    baseLikelihoods[other] = (1. / 3) * eps;
}
baseLikelihoods[base.base] = eps.complement();"))))

(slide
 #:name "Performance Considerations"
 (shadow-frame (big (t "Performance Considerations")))
 (pitem "Measure!")
 (pitem "Know the cost of algorithms")
 (blank 24)
 (mitem "Do not micro-optimize")
 (pitem "Trust the compiler")
 (blank 24)
 (pitem "Avoid heap-allocations")
 (pitem "Avoid indirection")
 (pitem "Avoid branching")
 (pitem "Pre-calculate often-used values"))

(slide
 #:name "Programming in C++"
 (shadow-frame (big (t "Programming in C++")))
 (para (emph "Why"))
 (pitem "Old language, new features")
 (pitem "High performance code")
 (pitem "Reusable code")
 (blank 24)
 (para (emph "How"))
 (pitem "Use available tools and ressources")
 (pitem "Safety through modern features")
 (pitem "Be aware of performance costs"))

(slide
 #:name "Compiling"
 (scale-to-fit (bitmap "compiling.png") client-w (/ client-h 1.5)))
