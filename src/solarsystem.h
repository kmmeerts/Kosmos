#ifndef KOSMOS_SOLARSYSTEM_H
#define KOSMOS_SOLARSYSTEM_H

#include "mathlib.h"
#include "keplerorbit.h"

typedef struct Body {
	char *name;
	double mass;
	double grav_param; /* Gravitational parameter */

	Vec3 position; /* Take care to update this before you use it */

	enum { BODY_STAR, BODY_PLANET, BODY_COMET, BODY_UNKNOWN } type;

	KeplerOrbit orbit; /* Optional */
	char *primary_name;
	struct Body *primary; /* Parent body */
} Body;

typedef struct SolarSystem {
	int num_bodies;
	Body body[];
} SolarSystem;

SolarSystem *solsys_load(const char *filename);
void solsys_update(SolarSystem *solsys, double time);

#endif
