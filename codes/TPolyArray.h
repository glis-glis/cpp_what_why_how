#ifndef TPOLY_ARRAY_H
#define TPOLY_ARRAY_H

#include <array>
#include <vector>
#include "TFunction.h"

template<size_t Order> class TPolyArray : public TFunction {
	std::array<double, Order> _coeffs;

public:
	TPolyArray(std::vector<double> Coeffs) { std::copy(Coeffs.begin(), Coeffs.end(), _coeffs.begin()); }

	double operator()(double x) const override {
		double r   = _coeffs.front();
		double xpi = 1.;
		for (size_t i = 1; i < Order; ++i) {
			xpi *= x;
			r += _coeffs[i] * xpi;
		}
		return r;
	}

	std::string getName() const override { return name; }

	static constexpr const char *const name = "TPolyArray";
};

template<size_t Order = 12> constexpr TFunction *makePoly(std::vector<double> &Coeffs) {
	if (Coeffs.size() > Order) throw "Unhappy!";
	if (Coeffs.size() == Order)
		return new TPolyArray<Order>(Coeffs);
	else
		return makePoly<Order - 1>(Coeffs);
}
template<> inline TFunction *makePoly<0>(std::vector<double> &Coeffs) {
	throw "Unhappy!";
}

#endif
