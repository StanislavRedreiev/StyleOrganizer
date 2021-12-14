//
//  SONavigationBarStyle.m
//  Style Organizer
//
//  Created by super team on 21.04.16.
//
//

#import "SONavigationBarStyle.h"

@implementation SONavigationBarStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SONavigationBarStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.translucent = self.translucent;
    newStyle.shadowImage = self.shadowImage;
    newStyle.shadowColor = self.shadowColor;
    newStyle.barTintColor = self.barTintColor;
    newStyle.barStyle = self.barStyle;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

- (UIColor *)textColor {
    if (!_textColor) {
        return self.tintColor;
    }
    return _textColor;
}

- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    self->_optionsSetted|=OptionsSettedTranslucent;
}

@end
