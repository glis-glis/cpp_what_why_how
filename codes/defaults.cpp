#include <iostream>
#include <array>
#include <vector>

////////////////////////////////////////////////////////////////////////////////
void printSecretInformation();
void snip_1() {
	int myNumber;
	std::cin >> myNumber;
	int secretNumber = 3;
	if (secretNumber = myNumber) printSecretInformation();
}

////////////////////////////////////////////////////////////////////////////////
void doReverse(int);
void snip_2() {
	std::array<int, 4> a{1, 2, 3, 4};
	a[4] = 10;
	for (size_t i = 3; i >= 0; --i) doReverse(a[i]);
}

////////////////////////////////////////////////////////////////////////////////
class TLargeObject{};

struct MyStruct {
	std::vector<TLargeObject*> objects;
	~MyStruct() {
		for (auto& o : objects) delete o;
	}
};

void doSomething(MyStruct mc);

void snip_3() {
	MyStruct ms;
	ms.objects.push_back(new TLargeObject);
	doSomething(ms);
}

////////////////////////////////////////////////////////////////////////////////
class MyClass {
    int _x;
public:
    int getXplus1() {return ++_x;}
};

int square(MyClass& mc) {
    return mc.getXplus1() * mc.getXplus1();
}
