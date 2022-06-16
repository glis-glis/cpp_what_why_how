#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <iostream>
#include <memory>
#include <numeric>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>

#include "TFunction.h"
#include "TPolyNaive.h"
#include "TPolyBetter.h"
#include "TPolyVector.h"
#include "TPolyStaticVector.h"
#include "TPolyArray.h"

constexpr size_t N = 10'000'000;
template<class Poly> double measureTemplate(const Poly &p) {
	using namespace std::chrono;

	std::vector<double> xs(N);
	std::iota(xs.begin(), xs.end(), 0.);

	const auto start = std::chrono::high_resolution_clock::now();

	const double result = std::accumulate(xs.begin(), xs.end(), 0., [&p](auto tot, auto v) { return tot + p(v); });

	const duration<double> dt = high_resolution_clock::now() - start;
	std::cout << dt.count() << "s\t" << p.getName() << '\n';
	return result;
}

double measureVirtual(const TFunction &p) {
	using namespace std::chrono;

	std::vector<double> xs(N);
	std::iota(xs.begin(), xs.end(), 0.);

	const auto start = std::chrono::high_resolution_clock::now();

	const double result = std::accumulate(xs.begin(), xs.end(), 0., [&p](auto tot, auto v) { return tot + p(v); });

	const duration<double> dt = high_resolution_clock::now() - start;
	std::cout << dt.count() << "s\t" << p.getName() << '\n';
	return result;
}

int main() {
	std::cout << "Please enter the polynomial coefficients a_i: a0 + a1*x + a2*x^2 + ...:\n";
	std::string line;
	std::getline(std::cin, line);
	std::istringstream iss(line);
	std::vector<double> as;
	double a;
	while (iss >> a) { as.push_back(a); }
	if (as.empty()) {
		std::cerr << "We need at least one coefficient!\n";
		return 1;
	};
	std::cout << "Will use polynomial of order " << as.size() - 1 << '\n';
	const auto pn  = TPolyNaive{as};
	const auto pu  = TPolyBetter{as};
	const auto pv  = TPolyVector{as};
	const auto pan = TPolyStaticVector{as};
	std::unique_ptr<TFunction> pa{makePoly(as)};

	std::cout << "Measuring templated function\n";
	std::array<double, 5> rs;
	rs[0] = measureTemplate(pn);
	rs[1] = measureTemplate(pu);
	rs[2] = measureTemplate(pv);
	rs[3] = measureTemplate(pan);
	rs[4] = measureTemplate(*pa);

	if (!std::equal(rs.begin(), rs.end(), rs.begin())) {
		std::cerr << "Polynomials are not creating same values!\n";
		return 1;
		
	}
	std::cout << "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
	std::cout << "Measuring virtual function\n";
	rs[0] = measureVirtual(pn);
	rs[1] = measureVirtual(pu);
	rs[2] = measureVirtual(pv);
	rs[3] = measureVirtual(pan);
	rs[4] = measureVirtual(*pa);

	if (!std::equal(rs.begin(), rs.end(), rs.begin())) {
		std::cerr << "Polynomials are not creating same values!\n";
		return 1;
		
	}

	return 0;
}
