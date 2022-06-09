#include <cmath>
#include <cstring>
#include <cstdio>

double norm(double X, double Y) noexcept {
	return std::sqrt(X*X + Y*Y);
}

struct TVector {
	double x;
	double y;
	double r; // invariant! do not change independently
};

void translate(TVector* V, double X, double Y) noexcept {
	// expects v not to be nullptr
	V->x += X;
	V->y += Y;
	V->r  = norm(V->x, V->y);
}

int main() {
	TVector v;
	std::memset(&v, 0, sizeof(v));
	printf("%f, %f: %f\n", v.x, v.y, v.r);

	translate(&v, 3., 4.);

	printf("%f, %f: %f\n", v.x, v.y, v.r);
}
