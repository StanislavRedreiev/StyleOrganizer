//
//  SOProgressViewStyle.m
//  Style Organizer
//
//  Created by Max on 22.12.16.
//
//

#import "SOProgressViewStyle.h"

@implementation SOProgressViewStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOProgressViewStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.progressViewStyle = self.progressViewStyle;
    newStyle.progressTintColor = self.progressTintColor;
    newStyle.trackTintColor = self.trackTintColor;
    newStyle.progressImage = self.progressImage;
    newStyle.trackImage = self.trackImage;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
