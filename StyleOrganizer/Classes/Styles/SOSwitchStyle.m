//
//  SOSwitchStyle.m
//  Style Organizer
//
//  Created by super team on 03.02.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOSwitchStyle.h"

@implementation SOSwitchStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOSwitchStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.onTintColor = self.onTintColor;
    newStyle.thumbTint = self.thumbTint;
    newStyle.cornerHalfSize = self.cornerHalfSize;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
