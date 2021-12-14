//
//  SOTextFieldStyle.m
//  Style Organizer
//
//  Created by super team on 4/16/16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOTextFieldStyle.h"

@implementation SOTextFieldStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOTextFieldStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.placeholder = self.placeholder;
    newStyle.text = self.text;
    newStyle.font = self.font;
    newStyle.textColor = self.textColor;
    newStyle.placeholderColor = self.placeholderColor;
    newStyle.placeholderFont = self.placeholderFont;
    newStyle.textAlignment = self.textAlignment;
    newStyle.clearsOnBeginEditing = self.clearsOnBeginEditing;
    newStyle.borderStyle = self.borderStyle;
    newStyle.clearButtonMode = self.clearButtonMode;
    newStyle.secureTextEntry = self.secureTextEntry;
    newStyle.returnKeyType = self.returnKeyType;
    newStyle.leftImage = self.leftImage;
    newStyle.padding = self.padding;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
