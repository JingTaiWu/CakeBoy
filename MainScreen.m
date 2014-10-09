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
        
        // Center Text
        // Add the text
        // create and initialize a Label
        NSString* text = @"Cake Boy's Adventure";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:30 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
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

-(void)onStart:(CCMenuItemFont *)button {
    // Start the Game
}
@end
