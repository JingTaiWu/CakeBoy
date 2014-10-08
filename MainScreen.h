//
//  MainScreen.h
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright (c) 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "QuitScreen.h"
#import "OptionsScreen.h"

@interface MainScreen : CCLayer
+(CCScene *) scene;
-(id) init;
-(void) onQuit: (CCMenuItemFont*) button;
-(void) onOptions: (CCMenuItemFont*) button;
@end
