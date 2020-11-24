
//{{BLOCK(level1)

//======================================================================
//
//	level1, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 36 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2304 + 2048 = 4864
//
//	Time-stamp: 2020-11-24, 13:43:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL1_H
#define GRIT_LEVEL1_H

#define level1TilesLen 2304
extern const unsigned short level1Tiles[1152];

#define level1MapLen 2048
extern const unsigned short level1Map[1024];

#define level1PalLen 512
extern const unsigned short level1Pal[256];

#endif // GRIT_LEVEL1_H

//}}BLOCK(level1)
