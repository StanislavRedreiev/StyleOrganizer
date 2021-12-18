//
//  SOSwitchStyle.h
//  Style Organizer
//
//  Created by super team on 03.02.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOBaseStyle.h"
#import <UIKit/UIKit.h>

@interface SOSwitchStyle : SOBaseStyle

@property(nonatomic, strong) UIColor *onTintColor;
@property(nonatomic, strong) UIColor *thumbTint;
@property(nonatomic) BOOL cornerHalfSize;

@end
