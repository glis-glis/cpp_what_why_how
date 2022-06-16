#include <array>
#include <cstddef>

void doReverse(int);
void snip_2() {
	std::array<int, 4> a{1, 2, 3, 4};
	a[4] = 10;
	for (size_t i = 3; i >= 0; --i) doReverse(a[i]);
}
