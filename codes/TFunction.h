#ifndef TFUNCTION_H
#define TFUNCTION_H

#include <string>

struct TFunction {
	virtual double operator()(double x) const = 0;
	virtual std::string getName() const       = 0;
	virtual ~TFunction()                      = default;
};

#endif
