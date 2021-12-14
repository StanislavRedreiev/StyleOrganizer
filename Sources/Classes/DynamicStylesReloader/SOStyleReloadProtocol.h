//
//  SOStyleReloadProtocol.h
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *reloadAllStylesNotification = @"ReloadAllStylesNotification";
static NSString *reloadStyleNotification = @"ReloadStyleNotification";

@protocol SOStyleReloadProtocol <NSObject>

- (void)reloadStyle;
- (void)styleDidChanged:(NSNotification*)notification;

@end
