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
    self = [super init];
	return self;
}

-(void)initWorld {
    [super initWorld];
}

@end
