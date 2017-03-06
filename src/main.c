//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "plants.h"

void interruption() {
   static u8 kk;

   if (kk == 5){
      cpct_setBorder(HW_RED);
   }else if (kk == 0){
      cpct_setBorder(HW_BLACK);
      cpct_setVideoMode(1);
    }else if (kk == 1){
       cpct_setBorder(HW_YELLOW);
       cpct_setVideoMode(0);
     }else if (kk == 2){
        cpct_setBorder(HW_GREEN);
      }else if (kk == 3){
         cpct_setBorder(HW_ORANGE);
       }else if (kk == 4){
          cpct_setBorder(HW_PURPLE);
   }else if (kk == 5) {
//      playmusic();
      cpct_scanKeyboard_if();
    }

    if (kk == 5){
      kk = 0;
   }else{
     kk++;
   }
}

void initialize() {
   cpct_disableFirmware();
   cpct_setVideoMode(0);
//   cpct_setPalette(g_palette, 16);
   //cpct_setBorder(HW_BLACK);
/*   cpct_etm_setTileset2x4(g_tileset);
   cpct_drawSprite(g_retropolis_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 0), G_RETROPOLIS_0_W, G_RETROPOLIS_0_H);
   cpct_drawSprite(g_retropolis_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 0), G_RETROPOLIS_0_W, G_RETROPOLIS_0_H);
   mapa = g_map1;
   num_mapa = 0;
   prota.x = prota.px = 0;
   prota.y = prota.py = 100;
   prota.estado = ST_quieto;
   prota.mira   = M_derecha;
   prota.nframe = 0;
   prota.mover  = NO;
   prota.frame  = &g_frames[0];
   dibujarMapa();
   dibujarProta();
   cpct_akp_musicInit(G_song);*/
   cpct_setInterruptHandler(interruption);
}

void main(void) {
   u8* pvmem;  // Pointer to video memory

   // Clear Screen
   cpct_memset(CPCT_VMEM_START, 0, 0x4000);
      cpct_setInterruptHandler(interruption);

   //initialize();

   // Draw String on the middle of the screen
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 0, 0);
   cpct_drawStringM1("Mode 1", pvmem, 1, 0);
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 0, 8);
   cpct_drawStringM1("Mode 1", pvmem, 1, 0);
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 0, 16);
   cpct_drawStringM1("Mode 1", pvmem, 1, 0);
   //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 0, 24);
   //cpct_drawStringM1("Mode 1", pvmem, 1, 0);

   // Draw String on the middle of the screen
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 0, 40);
   cpct_drawStringM0("Mode 0", pvmem, 1, 0);

   // Draw String on the middle of the screen
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   cpct_drawStringM0("Welcome to CPCtelera!", pvmem, 1, 0);

   // Loop forever
   while (1);
}
