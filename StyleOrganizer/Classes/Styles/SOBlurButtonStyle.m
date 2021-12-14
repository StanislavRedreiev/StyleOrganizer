//
//  SOBlurButtonStyle.m
//  Style Organizer
//
//  Created by super team on 15.01.2018.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOBlurButtonStyle.h"

@implementation SOBlurButtonStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOBlurButtonStyle *newStyle = [super copyWithZone:zone];
    newStyle.blurStyle = self.blurStyle;
    newStyle.vibrant = self.vibrant;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}


- (void)setBlurStyle:(UIBlurEffectStyle)blurStyle {
    _blurStyle = blurStyle;
}

@end
