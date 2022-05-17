#include <cmath>
#include <cstring>
#include <cstdio>
#include <iostream>
#include <array>

double safeSqrt(double X) {
	if (X < 0.) throw "X must be possitive";
	return sqrt(X);
}

double norm(double X, double Y) noexcept {
	return std::sqrt(X*X + Y*Y);
}

struct TVector {
	double x;
	double y;
	double r; // invariant! do not change independently
};

struct TVectorFP {
	const double x;
	const double y;
	const double r; // invariant! do not change independently
};

void translate(TVector* V, double X, double Y) noexcept {
	// expects v not to be nullptr
	V->x += X;
	V->y += Y;
	V->r  = norm(V->x, V->y);
}

////////////////////////////////////////////////////////////////////////////////


class TVectorOO {
private:
	double _x = 0.;
	double _y = 0.;
	double _r = 0.;
public:
	TVectorOO() = default;
	TVectorOO(double X, double Y) : _x(X), _y(Y), _r(norm(_x, _y)) {};
	TVectorOO& operator=(const TVectorOO & v) {
		_x = v._x;
		_y = v._y;
		_r = v._r;
		return *this;
	}

	bool operator<(const TVectorOO& v) const {
		return _r < v._r;
	}

	TVectorOO operator+(const TVectorOO &V) const {
		if (V._r == 0.) return *this;
		if (_r == 0.) return V;

		return TVectorOO(_x + V.x(), _y + V.y());
	}

	double x() const noexcept {return _x;}
	double y() const noexcept {return _y;}
	double r() const noexcept {return _r;}

	void setX(double X) {
		_x = X;
		_r = norm(_x, _y);
	}

	void setY(double Y) {
		_y = Y;
		_r = norm(_x, _y);
	}

	void set(double X, double Y) {
		_x = X;
		_y = Y;
		_r = norm(_x, _y);
	}
};

void translate(TVectorOO& V, double X, double Y) {
	V.set(V.x() + X, V.y() + Y);
}

int main() {
	TVectorOO voo;
	translate(voo, 3., 4.);
	std::cout << "OO: " << voo.x() << ", " << voo.y() << ": " << voo.r() << '\n';
	
	TVector v;
	std::memset(&v, 0, sizeof(v));
	printf("%f, %f: %f\n", v.x, v.y, v.r);

	translate(&v, 3., 4.);
	v.r = 1.;

	printf("%f, %f: %f\n", v.x, v.y, v.r);

	try {
		safeSqrt(-1);
	} catch (const char* someError) {
		std::cout << someError << '\n';
		return 1;
	}

	return 0;
}
