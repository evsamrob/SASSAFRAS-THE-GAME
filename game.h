// Structs
typedef struct {
    int col;
    int row;
    int width;
    int height;

    // movement
    int vx;
    int vy;
    int canJump;
    int lastJumpSide;
    int lastWallTouch;

    // logistical
    int level;
    int spawnCol;
    int spawnRow;
    int isCheating;
    int lives;

    // sprite variables
    int OAMIndex;
    int aniState;
    int aniCounter;
    int curFrame;
    int direction;
    int playerControls;
} PLAYER;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int showInteraction;
    int flip;
    int OAMIndex;
    int aniState;
    int aniCounter;
    int curFrame;
} RECORDPLAYER;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int OAMIndex;
} LIVESDISP;

enum {L1COL = 12, L1ROW = 24, L2COL = 120, L2ROW = 80, L3COL = 120, L3ROW = 80};

// Movement constants and helper macros
#define GRAVITY 70
#define JUMPPOWER 900
#define XACCELERATION 150
#define FRICTION 50
#define MAXVX 600
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)
enum {LEFT, RIGHT, ONGROUND};
enum {IDLE, RUNNING, ONWALL, JUMPING, FALLING, DYING, CHEATING};

// Variables
extern PLAYER player;
extern RECORDPLAYER recordPlayer;
extern LIVESDISP livesDisp;

// Functions
void initGame();
void updateGame();
void drawGame();

void initSprites();
void drawSprites();

void initPlayer();
void respawnPlayer();
void updatePlayer();

void initRecordPlayer();
void updateRecordPlayer();

void initLivesDisplay();
void updateLivesDisplay();