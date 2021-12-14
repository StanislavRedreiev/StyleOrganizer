//
//  SOSegmentedControlStyle.m
//  Style Organizer
//
//  Created by super team on 07.10.16.
//
//

#import "SOSegmentedControlStyle.h"

@implementation SOSegmentedControlStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOSegmentedControlStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.textAttributes = self.textAttributes;
    newStyle.selectedTextAttributes = self.selectedTextAttributes;
    newStyle.disabledTextAttributes = self.disabledTextAttributes;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
