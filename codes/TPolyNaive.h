#ifndef TPOLY_NAIVE_H
#define TPOLY_NAIVE_H

#include <cmath>
#include <vector>

#include "TFunction.h"

class TPolyNaive : public TFunction {
	std::vector<double> _coeffs;

public:
	TPolyNaive(std::vector<double> Coeffs) : _coeffs(std::move(Coeffs)) {}

	double operator()(double x) const {
		double r = _coeffs.front();
		for (size_t i = 1; i < _coeffs.size(); ++i) r += _coeffs[i] * std::pow(x, i);
		return r;
	}

	std::string getName() const { return name; }
	static constexpr const char *const name = "TPolyNaive";
};

#endif
