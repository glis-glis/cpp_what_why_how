#ifndef TVECTOR_H_
#define TVECTOR_H_

#include <cmath>

inline double dist(double x, double y) {
	return std::sqrt(x*x + y*y);
}

struct TVector {
	double x;
	double y;
	double r; // invariant! do not change independently
};

inline void translate(TVector* v, double x, double y) {
	// expects v not to be nullptr
	v->x += x;
	v->y += y;
	v->r  = dist(v->x, v->y);
}

inline void test() {
	TVector v{0., 0., 0.};
	translate(&v, 3., 4.);
	// v.x = 3, v.y = 4, v.r = 5
}


#endif
