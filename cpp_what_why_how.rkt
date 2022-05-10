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
        (mitem "Default ist manual")
        )))

(slide
 (shadow-frame (big (t "Future")))
 (para (it "It's difficult to make predictions, especially about the future"))
 (blank 24)
 (para (emph "Use two languages"))
 (aitem "Python/R/Lua/Scheme for convenience")
 (aitem "Rewrite slowest part in C/C++/FORTRAN")
 (aitem "numpy, PyTorch, TensorFlow, LAMMPS, pyRosetta")
 (blank 24)
 (para (emph "Solving the \"Two-language problem\""))
 (aitem "Fast compilation:")
 (eitem "Swift, D, Go")
 (aitem "Fast interpretation (JIT):")
 (eitem "Julia, PyPy, luaJIT"))

(slide
 (shadow-frame (big (t "Why C++")))
 (para "Runtime Speed" (colorize (tt "≫") "darkred") "Development Speed")
 (para "Runtime Speed" (colorize (tt "≈") "darkred") "Safety")
 (para "Runtime Speed" (colorize (tt "≪") "darkred") "Scalability")
 (blank 24)
 (pitem "Industrial standard")
 (pitem "Scales well in code- and team-size")
 (pitem "Modern Paradigms"))


(slide
 (shadow-frame (big (t "C++ Ressources")))
 (para (tt "cppreference.com"))
 (para (tt "isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines"))
 (para (tt "lefticus.gitbooks.io/cpp-best-practices"))
 (para (tt "godbolt.org"))
 (blank 24)
 (hc-append 10
  (scale-to-fit (bitmap "practice_programming.jpg") (/ client-w 3) (/ client-h 3))
  (scale-to-fit (bitmap "effective_cpp.jpg") (/ client-w 3) (/ client-h 3))
  (scale-to-fit (bitmap "effective_modern.jpg") (/ client-w 3) (/ client-h 3))))

(slide
 (shadow-frame (big (t "C++ Tools")))
 (para (bt "Compiler"))
 (eitem "gcc, clang, VC++")
 (pitem "Warnings are your friend")
 (mitem "Template errors are unreadable")
 (blank 24)
 (para (bt "IDE"))
 (eitem "CLion, Eclipse, Visual Studio Code, emacs, vim, ...")
 (pitem "On the fly compile errors")
 (pitem "Find files, grep in project")
 (pitem "Goto definition/declaration, find references")
 (pitem "Code formation")
 (pitem "Refactoring")
 )


(slide
 (shadow-frame (big (t "Default variables are unsafe")))
 (para (bt "Variables are mutable"))
 (para (frame (codeblock-pict
"int myNumber;
std::cin >> myNumber;
int secretNumber = 3;
if (secretNumber = myNumber) printSecretInformation();")))
 (blank 24)
 (para (bt "No buffer overflow check"))
 (para (frame (codeblock-pict
"std::array<int, 4> a{1, 2, 3, 4};
a[4] = 10;
for (size_t i = 3; i >= 0; --i) doReverse(a[i]);")))
 (blank 24)
 (para (bt "No memory check"))
 (para (frame (codeblock-pict
"MyClass* p = new MyClass;
delete p;
p->getName();"))))

 (slide
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
    [](auto ai) {doReverse(ai);}")))
 (blank 24)
 (para (bt "Use smart pointers"))
 (para (frame (codeblock-pict
"auto p = std::make_unique<MyClass>;
p->getName();"))))

(slide
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
    [](auto ai) {doReverse(ai);}")))
 (blank 24)
 (para (bt "Use smart pointers"))
 (para (frame (codeblock-pict
"auto p = std::make_unique<MyClass>;
p->getName();"))))

(slide
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
 (shadow-frame (big (t "Function attributes")))
 (para (tt "const") " member-function and references")
 (para (tt "constexpr") " (member-) function")
 (para (tt "noexcept") " (member-) function")
 (blank 24)
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
 (shadow-frame (big (t "Safe C++")))
 (pitem "Make variables const(expr)")
 (pitem "Make functions constexpr")
 (pitem "Make member-functions const(expr)")
 (blank 24)
 (pitem "Use algorithms, not raw loops")
 (pitem "Use smart pointers, not raw pointers")
 (blank 24)
 (pitem "Use modern C++ features")
 )

(slide
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
 (shadow-frame (big (t "Stack and Heap")))
 (para (bt "Stack memory is basically for free"))
 (pitem "Size known at compile-time")
 (pitem "On register or L1 cache")
 (para (frame (codeblock-pict
               "double x = 4;
constexpr size_t s = 100; // even cheaper
std::array<double, s> a;
MyClass mc; // assuming no heap-allocated member variable")))
 (blank 24)
 (para (bt "Heap memory is expensive"))
 (mitem "Size unknown at compile-time")
 (mitem "Could be on RAM (cache-miss)")
 (para (frame (codeblock-pict
               "std::vector<double> v{1., 2., 3., 4.};
v.push_back(5.);
auto unique = std::make_unique<MyClass>();
auto shared = std::make_shared<MyClass>();"))))
