//
//  Level3.m
//  Cakeboy
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "Level3.h"


@implementation Level3

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level3 *layer = [Level3 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level3 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"level3.tmx"];
    
    powerUpLayer = [world layerNamed:@"powerups"];
    
    self = [super init];
	return self;
}

-(void)initWorld {
    [super initWorld];
}

-(BOOL)isPowerUp: (int) gid {
    if(gid == RID_POWER_UP) {
        return true;
    } else {
        return false;
    }
}

-(void)update:(ccTime)dt {
    if(caught || complete)
        return;
    
    [super update:dt];
    
    if([grace collidesWith: powerUpLayer]) {
        [self handlePCObstacleCollision];
    }
    
    if(caught)
        [self handlePCCaught];
}

-(void)handlePowerUpCollision {
    //	CGPoint gracePos = [grace position];
	
	int x = grace.x;
	int y = grace.y;
    
    //    CGPoint contact = [Helper worldToTileX:x andY:y];
    CGPoint contact = [Helper world:world toTile:ccp(x,y)];
	
	int gid = [powerUpLayer tileGIDAt:contact];
	
	if(gid == 0) {
		x += world.tileSize.width;
		
        //		contact = [Helper worldToTileX:x andY:y];
        contact = [Helper world:world toTile:ccp(x,y)];
		
		gid = [powerUpLayer tileGIDAt:contact];
	} else if([self isPowerUp:gid]) {
        [enemies removeAllObjects];
    }
}
@end
