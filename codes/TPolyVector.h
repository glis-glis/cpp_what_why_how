#ifndef TPOLY_VECTOR_H
#define TPOLY_VECTOR_H

#include <vector>
#include "TFunction.h"


class TPolyVector : public TFunction {
	std::vector<double> _coeffs;

public:
	TPolyVector(std::vector<double> Coeffs) : _coeffs(std::move(Coeffs)) {}

	double operator()(double x) const override {
		double r   = _coeffs.front();
		double xpi = 1.;
		for (size_t i = 1; i < _coeffs.size(); ++i) {
			xpi *= x;
			r += _coeffs[i] * xpi;
		}
		return r;
	}
	std::string getName() const override { return name; }

	static constexpr const char *const name = "TPolyVector";
};

#endif
