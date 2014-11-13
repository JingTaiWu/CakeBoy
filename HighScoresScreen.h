//
//  HighScores.h
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HighScoresScreen : CCLayer

+(NSMutableArray*) getHighScores;
+(CCScene *) scene;
-(id) init;
-(void) onBack: (CCMenuItemFont*) button;

@end
