//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\TuxBlocksGame.java
//
//  Created by Thomas on 7/1/13.
//

@class TBGameBackgroundSprite;
@class TBSolidClock;
@protocol PlaynCoreImageLayer;
@protocol TripleplayGameScreenStack_Transition;

#import "JreEmulation.h"
#import "playn/core/Game.h"
#import "tripleplay/game/ScreenStack.h"

#define TBTuxBlocksGame_MAX_DELTA 49
#define TBTuxBlocksGame_UPDATE_RATE 33

@interface TBTuxBlocksGame : PlaynCoreGame_Default {
 @public
  TBSolidClock *clock_;
  TripleplayGameScreenStack *screens_;
  TBGameBackgroundSprite *background_;
  int frames_;
  double lastUpdate_;
  id<PlaynCoreImageLayer> fpsLayer_;
}

@property (nonatomic, retain) TBSolidClock *clock;
@property (nonatomic, retain) TripleplayGameScreenStack *screens;
@property (nonatomic, retain) TBGameBackgroundSprite *background;
@property (nonatomic, assign) int frames;
@property (nonatomic, assign) double lastUpdate;
@property (nonatomic, retain) id<PlaynCoreImageLayer> fpsLayer;

+ (int)UPDATE_RATE;
+ (TBTuxBlocksGame *)instance;
+ (void)setInstance:(TBTuxBlocksGame *)instance;
+ (int)screenDepth;
- (id)init;
- (void)init__ OBJC_METHOD_FAMILY_NONE;
- (void)updateFPS;
- (void)updateWithInt:(int)delta;
- (void)paintWithFloat:(float)alpha;
@end

typedef TBTuxBlocksGame TuxkidsTuxblocksCoreTuxBlocksGame;

@interface TBTuxBlocksGame_$1 : TripleplayGameScreenStack {
}

- (id<TripleplayGameScreenStack_Transition>)defaultPushTransition;
- (id<TripleplayGameScreenStack_Transition>)defaultPopTransition;
- (id)init;
@end