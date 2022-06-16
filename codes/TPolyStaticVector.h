#ifndef TPOLY_STATICVECTOR_H
#define TPOLY_STATICVECTOR_H

#include <array>
#include <vector>
#include "TFunction.h"

class TPolyStaticVector : public TFunction {
	static constexpr size_t N = 12;
	std::array<double, N> _coeffs;
	size_t _size;

public:
	TPolyStaticVector(std::vector<double> Coeffs) : _size(Coeffs.size()) {
		if (Coeffs.size() > _coeffs.size()) throw "Unhappy!";
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

	std::string getName() const { return name; }

	static constexpr const char *const name = "TPolyStaticVector";
};

#endif
