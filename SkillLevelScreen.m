//
//  SkillLevel.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "SkillLevelScreen.h"


@implementation SkillLevelScreen : CCLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SkillLevelScreen *layer = [SkillLevelScreen node];
	
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
        
        // Add the text
        // create and initialize a Label
        NSString* text = @"Select Difficulty";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the buttons to the menu
        CCMenuItem *beginnerButton =
        [CCMenuItemFont itemWithString:@"Beginner" target:self selector:@selector(toggleDifficulty:)];
        
        CCMenuItem *interButton =
        [CCMenuItemFont itemWithString:@"Intermediate" target:self selector:@selector(toggleDifficulty:)];
        
        CCMenuItem *difficultButton =
        [CCMenuItemFont itemWithString:@"Difficult" target:self selector:@selector(toggleDifficulty:)];
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:beginnerButton, interButton, difficultButton, backButton,nil];
        
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

-(void)toggleDifficulty:(CCMenuItemFont *)button {
}

@end
