//
//  UIView+SOStyleReloader.h
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOReloadStyleSubscriber.h"
#import <UIKit/UIKit.h>

@interface UIView (SOStyleReloader)

- (void)reloadStyle;
- (void)subscribeSelfForStyle;
- (void)unsubscribeSelfForStyle;

@end

@interface UIBarItem (SOStyleReloader)

- (void)reloadStyle;
- (void)subscribeSelfForStyle;
- (void)unsubscribeSelfForStyle;

@end
