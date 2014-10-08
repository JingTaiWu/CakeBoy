//
//  MainScreen.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright (c) 2014 JingtaiWu. All rights reserved.
//

#import "MainScreen.h"

@implementation MainScreen : CCLayer
+(CCScene *) scene {
    MainScreen *mainScreen = [MainScreen node];
    CCScene *scene = [CCScene node];
    [scene addChild:mainScreen];
    return scene;
}

-(id) init {
    self = [super init];
    
    if(self) {
        // Get the screen dimension
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // Add the buttons to the menu
        CCMenuItem *startButton =
        [CCMenuItemFont itemWithString:@"Start" target:self selector:@selector(onStart:)];
        
        CCMenuItem *optionsButton =
        [CCMenuItemFont itemWithString:@"Options" target:self selector:@selector(onOptions:)];
        
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenu *menu = [CCMenu menuWithItems:startButton, optionsButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        // Add the menu to the layer
        [self addChild:menu];
    }
    
    return self;
}

-(void) onQuit:(CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[QuitScreen scene]];
}

-(void)onOptions:(CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[OptionsScreen scene]];
}
@end
