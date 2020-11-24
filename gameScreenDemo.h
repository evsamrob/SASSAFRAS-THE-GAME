
//{{BLOCK(gameScreenDemo)

//======================================================================
//
//	gameScreenDemo, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 96 + 2048 = 2656
//
//	Time-stamp: 2020-11-10, 15:35:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREENDEMO_H
#define GRIT_GAMESCREENDEMO_H

#define gameScreenDemoTilesLen 96
extern const unsigned short gameScreenDemoTiles[48];

#define gameScreenDemoMapLen 2048
extern const unsigned short gameScreenDemoMap[1024];

#define gameScreenDemoPalLen 512
extern const unsigned short gameScreenDemoPal[256];

#endif // GRIT_GAMESCREENDEMO_H

//}}BLOCK(gameScreenDemo)
