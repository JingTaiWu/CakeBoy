//
//  Options.h
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface OptionsScreen : CCLayer
+(CCScene *) scene;
-(id) init;
-(void) onAudio: (CCMenuItemFont*) button;
-(void) onSkillLevel: (CCMenuItemFont*) button;
-(void) onHighScore: (CCMenuItemFont*) button;
-(void) onBack: (CCMenuItemFont*) button;
@end
