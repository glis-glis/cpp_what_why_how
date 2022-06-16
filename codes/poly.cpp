#include <chrono>
#include <cmath>
#include <iostream>
#include <numeric>
#include <vector>
#include <array>
#include <sstream>
#include <string_view>
#include <memory>

struct TPoly {
	virtual double operator()(double x) const = 0;
	virtual const char * const getName() const = 0;
	virtual ~TPoly() = default;
};

template<size_t Order>
class TPolyAr : public TPoly {
	std::array<double, Order> _coeffs;
public:
	TPolyAr(std::vector<double> Coeffs) {
		std::copy(Coeffs.begin(), Coeffs.end(), _coeffs.begin());
	}

	double operator()(double x) const override {
		double r   = _coeffs.front();
		double xpi = 1.;
		for (size_t i = 1; i < Order; ++i) {
			xpi *= x;
			r += _coeffs[i] * xpi;
		} 
		return r;
	}

	const char * const getName() const override {return name;}
	
	static constexpr const char *const name = "TPolyAr";
};

template<size_t Order = 12>
TPoly *makePoly(std::vector<double>& Coeffs) {
	if (Coeffs.size() > Order) throw "Unhappy!";
	if (Coeffs.size() == Order) return new TPolyAr<Order>(Coeffs);
	else return makePoly<Order-1>(Coeffs);
}
template<>
TPoly *makePoly<0>(std::vector<double> &Coeffs) { throw "Unhappy!"; }

template<size_t N=12>
class TPolyArNaive {
	std::array<double, N> _coeffs;
	size_t _size;
public:
	TPolyArNaive(std::vector<double> Coeffs) : _size(Coeffs.size()){
		if(Coeffs.size() > _coeffs.size()) throw "Unhappy!";
		std::copy(Coeffs.begin(), Coeffs.end(), _coeffs.begin());
	}

	double operator()(double x) const {
		double r   = _coeffs.front();
		double xpi = 1.;
		for (size_t i = 1; i < _size; ++i) {
			xpi *= x;
			r += _coeffs[i] * xpi;
		} 
		return r;
	}

	const char * const getName() const {return name;}

	static constexpr const char *const name = "TPolyArNaive";
};

class TPolyVec {
	std::vector<double> _coeffs;
public:
	TPolyVec(std::vector<double> Coeffs) : _coeffs(std::move(Coeffs)) {
	}

	double operator()(double x) const {
		double r   = _coeffs.front();
		double xpi = 1.;
		for (size_t i = 1; i < _coeffs.size(); ++i) {
			xpi *= x;
			r += _coeffs[i] * xpi;
		} 
		return r;
	}
	const char * const getName() const {return name;}

	static constexpr const char *const name = "TPolyVec";
};

class TPolyNaive {
	std::vector<double> _coeffs;
public:
	TPolyNaive(std::vector<double> Coeffs) : _coeffs(std::move(Coeffs)) {
	}

	double operator()(double x) const {
		double r = _coeffs.front();
		for (size_t i = 1; i < _coeffs.size(); ++i) r += _coeffs[i] * std::pow(x, i);
		return r;
	}

	const char * const getName() const {return name;}
	static constexpr const char *const name = "TPolyNaive";
};

template<class Poly, size_t N = 1'000'000> double measure(const Poly &p) {
	using namespace std::chrono;
	std::cout << "using " << p.getName() << '\n';

	double result;
	std::vector<double> xs(N);
	std::iota(xs.begin(), xs.end(), 0.);

	const auto start = std::chrono::high_resolution_clock::now();
	for (const auto x : xs) result += p(x);
	const duration<double> dt = high_resolution_clock::now() - start;

	std::cout << "Calculating " << N << " polynoms took " << dt.count() << "s\n";
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
	const auto pn = TPolyNaive{as};
	const auto pv = TPolyVec{as};
	const auto pan = TPolyArNaive<>{as};
	std::unique_ptr<TPoly> pa{makePoly(as)};

	const auto ctp = TPolyAr<4>(as);

	for (size_t i = 0; i < 5; ++i) {
		std::cout << pn(i) << ", " << pv(i) << ", " << pan(i) << ", " << (*pa)(i) << '\n';
	}
	volatile auto dummyn = measure(pn);
	volatile auto dummyv = measure(pv);
	volatile auto dummyan = measure(pan);
	volatile auto dummya = measure(*pa);
	volatile auto dummyc = measure(ctp);
	return 0;
}
