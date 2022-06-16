#include <iostream>
#include <vector>

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
