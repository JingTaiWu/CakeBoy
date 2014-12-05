//
//  HighScore.h
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HighScoresScreen.h"

@interface HighScoreScreen : CCLayer {
    NSUserDefaults *highscores;
}

+(CCScene *) scene;
-(id) init;
-(void) onContinue: (CCMenuItemFont*) button;

@end
