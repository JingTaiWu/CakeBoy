//
//  Quit.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "QuitScreen.h"


@implementation QuitScreen : CCLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	QuitScreen *layer = [QuitScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}

- (id) init {
    if( (self=[super init])) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // create and initialize a Label
        NSString* text = @"Are you sure?";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the yes button
        CCMenuItem *yesButton =
        [CCMenuItemFont itemWithString:@"Yes" target:self selector:@selector(onQuit:)];
        
        // Add the no button
        CCMenuItem *noButton =
        [CCMenuItemFont itemWithString:@"No" target:self selector:@selector(onBackToMainScreen:)];
        
        CCMenu *menu = [CCMenu menuWithItems:yesButton, noButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

- (void) onBackToMainScreen:(CCMenuItemFont *)button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onQuit:(CCMenuItemFont *)button {
    exit(0);
}
@end
