//
//  GameOver.m
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import "GameOverScreen.h"
#import "MainScreen.h"
#import "HighScoreScreen.h"
#import "Score.h"
#import "LevelSequence.h"


@implementation GameOverScreen : CCLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOverScreen *layer = [GameOverScreen node];
	
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
        NSString* text = @"Game Over!";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:30 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        CCMenuItem *continueButton =
        [CCMenuItemFont itemWithString:@"Continue" target:self selector:@selector(onContinue:)];
        
        CCMenu *menu = [CCMenu menuWithItems: continueButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        // Add the menu to the layer
        [self addChild:menu];
        
        [LevelSequence setLevel: 0];
    }
    
    return self;
}

-(void)onContinue:(CCMenuItemFont *)button {
    // Goes back to the previous screen
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:2.0 scene:[HighScoreScreen scene]]];
//    NSInteger endingScore = @([Score score]);
//    NSMutableArray* highscores = [HighScoresScreen getHighScores];
//    // check to see if it is a new high score
//    BOOL isNewHighScore = false;
//    // sort the array
//    [highscores sortedArrayUsingSelector:@selector(compare:)];
//    for(int i = 0; i < [highscores count]; i++) {
//        if(endingScore < [[highscores objectAtIndex:i] integerValue]) {
//            isNewHighScore = false;
//        } else {
//            isNewHighScore = true;
//        }
//    }
//    // add the current score to the list of scores
//    [highscores addObject:endingScore];
//    // If it is a high score, push the high score screen
//    if(isNewHighScore) {
//        [[CCDirector sharedDirector] pushScene:[HighScoresScreen scene]];
//    } else {
//        // if not, go back to the main screen
//        [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
//    }
}

-(NSComparisonResult)compare:(NSInteger*)otherObject {
    return [self compare:otherObject];
}
@end
