//
//  Audio.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "AudioScreen.h"
#import "SimpleAudioEngine.h"
#import "Options.h"

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
        CCMenuItem *audioOn =
        [CCMenuItemFont itemWithString:@"Audio On" target:self selector:@selector(toggleSoundOn:)];
        CCMenuItem *audioOff =
        [CCMenuItemFont itemWithString:@"Audio Off" target:self selector:@selector(toggleSoundOff:)];
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:audioOn, audioOff, backButton,nil];
        
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

-(void)toggleSoundOn:(CCMenuItemFont *)button {
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"4225775_The_River_War_Original_Mix.mp3" loop:true];
    [Options enableMusic:true];
    [Options enableSounds:true];
}

-(void)toggleSoundOff:(CCMenuItemFont *)button {
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [Options enableMusic:true];
    [Options enableSounds:false];
}
@end
