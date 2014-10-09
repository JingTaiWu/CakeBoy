//
//  Audio.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "AudioScreen.h"


@implementation AudioScreen : CCLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AudioScreen *layer = [AudioScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}

-(id) init {
    self = [super init];
    
    if(self) {
        // Get the screen dimension
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // Add the buttons to the menu
        CCMenuItem *audioButton =
        [CCMenuItemFont itemWithString:@"Audio On/Off" target:self selector:@selector(toggleSound:)];
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:audioButton, backButton,nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        // Add the menu to the layer
        [self addChild:menu];
    }
    
    return self;
}

-(void)onBack:(CCMenuItemFont *)button {
    // Goes back to the previous screen
    [[CCDirector sharedDirector] popScene];
}

-(void)toggleSound:(CCMenuItemFont *)button {
}
@end
