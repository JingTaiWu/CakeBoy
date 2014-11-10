//
//  HighScore.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "HighScoreScreen.h"
#import "MainScreen.h"
#import "Score.h"

@implementation HighScoreScreen

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HighScoreScreen *layer = [HighScoreScreen node];
	
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
        
        // Center Text
        // Add the text
        // create and initialize a Label
        NSNumber* score = @([Score score]);
        NSString* text = @"Your New High Score";
        text = [text stringByAppendingString:[score stringValue]];
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:30 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/0.5 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // display the top 3 high scores
        NSMutableArray* highscores = [HighScoresScreen getHighScores];
        NSMutableArray* scores = [[NSMutableArray alloc] init];
        int count = 1;
        for(int i = [highscores count] - 1; i >=0; i--) {
            if(count > 3) break;
            NSString* score = [[highscores objectAtIndex:i] stringByAppendingString:@("")];
            CCMenuItem* tempLabel = [CCMenuItemFont itemWithString:score target:self selector:@selector(onBack:)];
            [scores addObject:tempLabel];
            count++;
        }
        
        CCMenuItem *continueButton =
        [CCMenuItemFont itemWithString:@"Continue" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems: continueButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        // Add the menu to the layer
        [self addChild:menu];
    }
    
    return self;
}

-(void)onContinue:(CCMenuItemFont *)button {
    // Goes back to the previous screen
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

@end
