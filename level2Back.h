
//{{BLOCK(level2Back)

//======================================================================
//
//	level2Back, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 157 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 5024 + 8192 = 13728
//
//	Time-stamp: 2020-11-23, 16:13:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL2BACK_H
#define GRIT_LEVEL2BACK_H

#define level2BackTilesLen 5024
extern const unsigned short level2BackTiles[2512];

#define level2BackMapLen 8192
extern const unsigned short level2BackMap[4096];

#define level2BackPalLen 512
extern const unsigned short level2BackPal[256];

#endif // GRIT_LEVEL2BACK_H

//}}BLOCK(level2Back)
