#include <algorithm>
#include <array>
#include <chrono>
#include <iostream>
#include <memory>
#include <numeric>
#include <sstream>
#include <string>
#include <vector>
#include <functional>

#include "TFunction.h"
#include "TPolyArray.h"
#include "TPolyBetter.h"
#include "TPolyNaive.h"
#include "TPolyStaticVector.h"
#include "TPolyVector.h"

constexpr double N = 1e7;
template<class Poly> auto measureTemplate(const Poly &p) {
	using namespace std::chrono;

	const auto start = high_resolution_clock::now();

	double result = 0.;
	for (double d = 0.; d < N; ++d) result += p(d);

	const duration<double> dt = high_resolution_clock::now() - start;

	return std::make_pair(result, dt.count());
}

auto measureVirtual(const TFunction &f) {
	using namespace std::chrono;

	const auto start = high_resolution_clock::now();

	double result = 0.;
	for (double d = 0.; d < N; ++d) result += f(d);

	const duration<double> dt = high_resolution_clock::now() - start;

	return std::make_pair(result, dt.count());
}

auto measureFunction(std::function<double(double)> sf) {
	using namespace std::chrono;

	const auto start = high_resolution_clock::now();

	double result = 0.;
	for (double d = 0.; d < N; ++d) result += sf(d);

	const duration<double> dt = high_resolution_clock::now() - start;
	return std::make_pair(result, dt.count());
}

int main(int argc, char *argv[]) {
	std::vector<double> as;
	if (argc <= 1) {
		as = {1., 2., 3., 4};
	}
	for (size_t i = 1; i < argc; ++i) {
		try {
			as.push_back(std::stof(argv[i]));
		} catch (std::invalid_argument const &ex) {
			std::cerr << "Cannot convert " << i << "° argument '" << argv[i] << "' to floating point\n";
			return 1;
		}
	}
	if (as.size() > TPolyStaticVector::N) {
		std::cerr << "We allow at most " << TPolyStaticVector::N << " coefficient!\n";
		return 1;
	}

	// Print polynomial and derivatives
	std::cout << "Will use the folowing polynomial function of order " << as.size() - 1 << '\n';
	std::vector<double> ds(as.begin(), as.end());
	int d = 0;
	while(ds.size() > 0) {
		std::cout << std::string(ds.size() - 1, ' ') << 'f' << std::string(d++, '\'') << "(x) = " << ds.front();
		for (size_t i = 1; i < ds.size(); ++i) {
			std::cout << " + " << ds[i] << "x";
			if (i > 1) std::cout << "^" << i;
			ds[i] *= i;
		}
		std::cout << '\n';
		ds.erase(ds.begin());
	}
	std::cout << "\n\n";

	// Print Table
	std::cout << "Caluculating the sum[f(x_i)] for x_i = 0 ... " << N << " - 1\n";
	std::cout << std::string(60, '_') << '\n';
	std::cout << "templated\tvirtual\t\tstd::function\tname\n";
	std::cout << std::string(60, '_') << '\n';

	// Naive
	const auto pNaive   = TPolyNaive{as};
	std::function<double(double)> fnNaive  = TPolyNaive{as};

	const auto tNaive = measureTemplate(pNaive);  
	std::cout << tNaive.second << "s\t" << std::flush;
	const auto vNaive = measureVirtual(pNaive);  
	std::cout << vNaive.second << "s\t" << std::flush;
	const auto fNaive = measureFunction(fnNaive);
	std::cout << fNaive.second << "s\t" << pNaive.getName() << '\n';

	// Better
	const auto pBetter   = TPolyBetter{as};
	std::function<double(double)> fnBetter  = TPolyBetter{as};

	const auto tBetter = measureTemplate(pBetter);  
	const auto vBetter = measureVirtual(pBetter);  
	const auto fBetter = measureFunction(fnBetter);  
	std::cout << tBetter.second << "s\t" << vBetter.second << "s\t" << fBetter.second << "s\t" << pBetter.getName() << '\n';

	// Vector
	const auto pVector   = TPolyVector{as};
	std::function<double(double)> fnVector  = TPolyVector{as};

	const auto tVector = measureTemplate(pVector);  
	const auto vVector = measureVirtual(pVector);  
	const auto fVector = measureFunction(fnVector);  
	std::cout << tVector.second << "s\t" << vVector.second << "s\t" << fVector.second << "s\t" << pVector.getName() << '\n';

	// StaticVector
	const auto pStaticVector   = TPolyStaticVector{as};
	std::function<double(double)> fnStaticVector  = TPolyStaticVector{as};

	const auto tStaticVector = measureTemplate(pStaticVector);  
	const auto vStaticVector = measureVirtual(pStaticVector);  
	const auto fStaticVector = measureFunction(fnStaticVector);  
	std::cout << tStaticVector.second << "s\t" << vStaticVector.second << "s\t" << fStaticVector.second << "s\t" << pStaticVector.getName() << '\n';

	// Array
	std::unique_ptr<TFunction> unique{makePolyArray(as)};
	const auto &pArray = *unique.get();
	std::function<double(double)> fnArray  = makePolyArrayFn(as);

	const auto tArray = measureTemplate(pArray);  
	const auto vArray = measureVirtual(pArray);  
	const auto fArray = measureFunction(fnArray);  

	std::cout << tArray.second << "s\t" << vArray.second << "s\t" << fArray.second << "s\t" << pArray.getName() << '\n';
	std::cout << std::string(60, '_') << '\n';

	std::vector<double> results;
	results.reserve(16);
	results.push_back(tNaive.first);
	results.push_back(vNaive.first);
	results.push_back(fNaive.first);
	results.push_back(tBetter.first);
	results.push_back(vBetter.first);
	results.push_back(fBetter.first);
	results.push_back(tVector.first);
	results.push_back(vVector.first);
	results.push_back(fVector.first);
	results.push_back(tStaticVector.first);
	results.push_back(vStaticVector.first);
	results.push_back(fStaticVector.first);
	results.push_back(tArray.first);
	results.push_back(vArray.first);
	results.push_back(fArray.first);


	if (!std::equal(results.begin(), results.end(), results.begin())) {
		std::cerr << "Polynomials are not creating same values!\n";
		return 1;
	}

	return 0;
}
