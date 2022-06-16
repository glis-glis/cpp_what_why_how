
class MyClass {
    int _x;
public:
    int getXplus1() {return ++_x;}
};

int square(MyClass& mc) {
    return mc.getXplus1() * mc.getXplus1();
}
