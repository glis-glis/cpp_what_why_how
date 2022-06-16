#ifndef TPOLY_BETTER_H
#define TPOLY_BETTER_H

#include <vector>
#include "TFunction.h"

constexpr double myPow(double base, unsigned int exp) {
	if (exp == 0) return 1;
	if (exp == 1) return base;
	if (exp == 2) return base * base;
	if (exp == 3) return base * base * base;

	double result = 1;

	while (exp > 1) {
		if (exp & 1) result *= base; // is odd
		exp >>= 1;
		base *= base;
	}
	return result * base;
}

class TPolyBetter : public TFunction {
	std::vector<double> _coeffs;

public:
	TPolyBetter(std::vector<double> Coeffs) : _coeffs(std::move(Coeffs)) {}

	double operator()(double x) const override {
		double r = _coeffs.front();
		for (size_t i = 1; i < _coeffs.size(); ++i) { r += _coeffs[i] * myPow(x, i); }
		return r;
	}

	std::string getName() const override { return name; }
	static constexpr const char *const name = "TPolyBetter";
};

#endif
