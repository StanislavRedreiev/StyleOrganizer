//
//  SOLabelStyle.m
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOLabelStyle.h"

@implementation SOLabelStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOLabelStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.textColor = self.textColor;
    newStyle.highlightedTextColor = self.highlightedTextColor;
    newStyle.font = self.font;
    newStyle.shadowColor = self.shadowColor;
    newStyle.fontColor = self.fontColor;
    newStyle.fontSize = self.fontSize;
    newStyle.textAttributes = self.textAttributes;
    newStyle.textAlignment = self.textAlignment;
    newStyle.numberOfLines = self.numberOfLines;
    newStyle.kerning = self.kerning;
    newStyle.minimumFontScale = self.minimumFontScale;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

- (NSDictionary<NSString *,id> *)textAttributes {
    return [self fixAtttributes:_textAttributes];
}

- (NSDictionary<NSString *,id> *)fixAtttributes:(NSDictionary<NSString *,id> *)sourceAttributes {
    NSMutableDictionary<NSString *,id> *attributes = sourceAttributes.mutableCopy;
    if (!attributes[NSFontAttributeName]) {
        attributes[NSFontAttributeName] = _font;
    }
    if (!attributes[NSForegroundColorAttributeName]) {
        attributes[NSForegroundColorAttributeName] = _textColor;
    }
    return attributes;
}

@end
