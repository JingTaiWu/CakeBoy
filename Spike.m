//
//  Spike.m
//  Cakeboy
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "Spike.h"


@implementation Spike

- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ {
    [super initWithFrames: @"gorgon.png" width:32 andHeight:32];
    
	state = STATE_ALIVE;
    
    [self collisionEvent];
	
	[self setPosition:here];
    
    level = level_;
	
	return self;
}

- (void) collisionEvent {
	if(state != STATE_ALIVE)
		return;
}

- (void) update {
	if(state == STATE_ALIVE)
		[super update];
}

@end
