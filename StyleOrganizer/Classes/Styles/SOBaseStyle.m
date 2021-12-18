//
//  RMBaseStyle.m
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOBaseStyle.h"


@interface SOBaseStyle ()

@property(nonatomic,readwrite)  BOOL applyContentMode;

@end


@implementation SOBaseStyle
@synthesize optionsSetted = _optionsSetted;

- (instancetype)copyWithZone:(NSZone *)zone {
    SOBaseStyle *newStyle = [[[self class] allocWithZone:zone] init];
    newStyle.cornerRadius = self.cornerRadius;
    newStyle.maskToBounds = self.maskToBounds;
    newStyle.backgroundColor = self.backgroundColor;
    newStyle.borderWidth = self.borderWidth;
    newStyle.cornerRadius = self.cornerRadius;
    newStyle.borderColor = self.borderColor;
    newStyle.tintColor = self.tintColor;
    newStyle.applyContentMode = self.applyContentMode;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    _contentMode = contentMode;
    self.applyContentMode = YES;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    _optionsSetted|=OptionsSettedCornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    _optionsSetted|=OptionsSettedBorderWidth;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    _optionsSetted|=OptionsSettedShadowOffset;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    _optionsSetted|=OptionsSettedShadowRadius;
}

- (void)setShadowOpacity:(float)shadowOpacity {
    _shadowOpacity = shadowOpacity;
    _optionsSetted|=OptionsSettedShadowOpacity;
}

- (void)setMaskToBounds:(BOOL)maskToBounds {
    _maskToBounds = maskToBounds;
    _optionsSetted|=OptionsSettedMaskToBounds;
}

- (void)setTransform:(CGAffineTransform)transform {
    _transform = transform;
    _optionsSetted|=OptionsSettedTransform;
}

@end
