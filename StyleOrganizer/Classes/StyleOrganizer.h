//  StyleOrganizer.h
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SOBaseStyle.h"
#import "SOButtonStyle.h"
#import "SOImageViewStyle.h"
#import "SOLabelStyle.h"
#import "SONavigationBarStyle.h"
#import "SOPageControlStyle.h"
#import "SOSwitchStyle.h"
#import "SOTextFieldStyle.h"
#import "SOViewStyle.h"
#import "SOSegmentedControlStyle.h"
#import "SOProgressViewStyle.h"
#import "SOTabBarStyle.h"
#import "SOBarButtonItemStyle.h"
#import "SOBlurButtonStyle.h"
#import "SOGradientViewStyle.h"

@interface StyleOrganizer : NSObject

+ (instancetype)sharedStyleManager;
- (void)setStyle:(SOBaseStyle *)style forKey:(NSString *)key;
- (SOBaseStyle *)styleForKey:(NSString *)key;
- (void)reloadStyleForKey:(NSString*)key;
- (void)reloadAllStyles;

@end
