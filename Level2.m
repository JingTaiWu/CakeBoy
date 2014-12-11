//
//  Level2.m
//  Cakeboy
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "Level2.h"


@implementation Level2

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level2 *layer = [Level2 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level2 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"level2.tmx"];
    
    obstacleLayer = [world layerNamed:@"obstacles"];
    
    self = [super init];
	return self;
}

-(void)initWorld {
    [super initWorld];
}

-(void)handlePCObstacleCollision {
    //	CGPoint gracePos = [grace position];
	
	int x = grace.x;
	int y = grace.y;
    
    //    CGPoint contact = [Helper worldToTileX:x andY:y];
    CGPoint contact = [Helper world:world toTile:ccp(x,y)];
	
	int gid = [obstacleLayer tileGIDAt:contact];
	
	if(gid == 0) {
		x += world.tileSize.width;
		
        //		contact = [Helper worldToTileX:x andY:y];
        contact = [Helper world:world toTile:ccp(x,y)];
		
		gid = [obstacleLayer tileGIDAt:contact];
	} else if([self isSpike:gid]) {
        caught = true;
    } else if([self isJello:gid]) {
        caught = true;
        [obstacleLayer removeTileAt:contact];
    }
}

-(bool)isSpike:(int)gid {
    if (gid == RID_SPIKES) {
        return true;
    } else {
        return false;
    }
}

-(bool) isJello:(int)gid {
    if (gid == RID_JELLO) {
        return true;
    } else {
        return false;
    }
}


-(void)update:(ccTime)dt {
    if(caught || complete)
        return;
    
    [super update:dt];
    
    
    if([grace collidesWith: obstacleLayer]) {
        [self handlePCObstacleCollision];
    }
    
    if(caught)
        [super handlePCCaught];
}
@end
