#ifndef _PLANTS_H_
#define _PLANTS_H_

#include <types.h>

#define GRID_H 5
#define GRID_W 9

typedef {
  u8 x;
  u8 y;
  u8 plantType;
} TPlant;

typedef{
  u8 x;
  u8 y;
  u8 speed;
} TProjectile;

#endif
