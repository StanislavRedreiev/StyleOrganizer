//
//  SOPageControlStyle.m
//  Style Organizer
//
//  Created by super team on 08.07.16.
//
//

#import "SOPageControlStyle.h"

@implementation SOPageControlStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOPageControlStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.pageIndicatorTintColor = self.pageIndicatorTintColor;
    newStyle.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
    newStyle.hidesForSinglePage = self.hidesForSinglePage;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
