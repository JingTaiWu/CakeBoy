//
//  Level2.h
//  Cakeboy
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Level1.h"
#import "Helper.h"

#define RID_JELLO 42
#define RID_SPIKES 89
@interface Level2 : Level1 {
    CCTMXLayer* obstacleLayer;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Handles PC-rewards collisions */
- (void) handlePCObstacleCollision;

- (bool) isSpike: (int) gid;

- (bool) isJello: (int) gid;

- (void) update:(ccTime)dt;
@end
