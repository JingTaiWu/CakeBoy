//
//  Quit.h
//  Cakeboy
//
//  Created by Marist User on 10/7/14.
//  Copyright 2014 JingtaiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface QuitScreen : CCLayer
/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen */
- (id) init;

/** Handles pressing the back button */
- (void) onBackToMainScreen: (CCMenuItemFont*) button;

/** Handles pressing the yes button*/
- (void) onQuit: (CCMenuItemFont*) button;
@end
