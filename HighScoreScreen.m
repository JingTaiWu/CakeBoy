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
        // Intialize the scores with NS userDefaults
        if(highscores == nil) {
            highscores = [NSUserDefaults standardUserDefaults];
            [highscores setInteger:0 forKey:@"HighScore1"];
            [highscores setInteger:0 forKey:@"HighScore2"];
            [highscores setInteger:0 forKey:@"HighScore3"];
        }
        
        // Load all the scores
        int arr[] = {[highscores integerForKey:@"HighScore1"], [highscores integerForKey:@"HighScore2"], [highscores integerForKey:@"HighScore3"]};
        
        if([Score score] > arr[0]) {
            arr[0] = [Score score];
        } else if([Score score] > arr[1]) {
            arr[1] = [Score score];
        } else if([Score score] > arr[2]) {
            arr[2] = [Score score];
        }
        
        // Get the screen dimension
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // Center Text
        // Add the text
        // create and initialize a Label
        NSString* text = @"High Score";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:30 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight/1.4 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Print the high score
        NSString *basescore1 = @"";
        
        basescore1 = [basescore1 stringByAppendingString:[NSString stringWithFormat:@"%d", arr[0]]];
        
        CCLabelTTF *highscore1 = [CCLabelTTF labelWithString:basescore1 fontName:@"Marker Felt" fontSize:30];
        
        NSString *basescore2 = @"";
        
        basescore2 = [basescore2 stringByAppendingString:[NSString stringWithFormat:@"%d", arr[1]]];
        
        CCLabelTTF *highscore2 = [CCLabelTTF labelWithString:basescore2 fontName:@"Marker Felt" fontSize:30];
        
        NSString *basescore3 = @"";
        
        basescore3 = [basescore3 stringByAppendingString:[NSString stringWithFormat:@"%d", arr[2]]];
        
        CCLabelTTF *highscore3 = [CCLabelTTF labelWithString:basescore3 fontName:@"Marker Felt" fontSize:30];
        
        highscore1.position = ccp( screenWidth /2 , screenHeight/1.5 );
        highscore2.position = ccp( screenWidth /2 , screenHeight/1.7 );
        highscore3.position = ccp( screenWidth /2 , screenHeight/1.95 );
        
        
        [self addChild:highscore1];
        [self addChild:highscore2];
        [self addChild:highscore3];
        
        CCMenuItem *continueButton =
        [CCMenuItemFont itemWithString:@"Continue" target:self selector:@selector(onContinue:)];
        
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
    [[CCDirector sharedDirector] popScene];
}

@end
