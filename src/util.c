#include "util.h"

//from retropolis example
u8 checkKeys(const cpct_keyID* k, u8 numk) {
   u8 i;
//   cpct_scanKeyboard_if();
   if (cpct_isAnyKeyPressed()) {
      for(i=1; i <= numk; i++, k++) {
         if (cpct_isKeyPressed(*k))
            return i;
      }
   }
   return 0;
}
