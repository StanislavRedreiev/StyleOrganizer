//
//  SOButtonStyle.m
//  Style Organizer
//
//  Created by super team on 27.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOButtonStyle.h"

@implementation SOButtonStyle
@synthesize imageInsets = _imageInsets;
@synthesize titleInsets = _titleInsets;
@synthesize contentInsets = _contentInsets;

- (instancetype)copyWithZone:(NSZone *)zone {
    SOButtonStyle *newStyle = [super copyWithZone:zone];
    newStyle.font = self.font;
    newStyle.textColor = self.textColor;
    newStyle.highlightedBgColor = self.highlightedBgColor;
    newStyle.highlightedTextColor = self.highlightedTextColor;
    newStyle.disabledBgColor = self.disabledBgColor;
    newStyle.disabledBorderColor = self.disabledBorderColor;
    newStyle.disabledTextColor = self.disabledTextColor;
    newStyle.textAttributes = self.textAttributes;
    newStyle.hightLightedTextAttributes = self.hightLightedTextAttributes;
    newStyle.highlightedBorderColor = self.highlightedBorderColor;
    newStyle.disabledTextAttributes = self.disabledTextAttributes;
    newStyle.image = self.image;
    newStyle.selectedTextAttributes = self.selectedTextAttributes;
    newStyle.renderingMode = self.renderingMode;
    newStyle.contentInsets = self.contentInsets;
    newStyle.titleInsets = self.titleInsets;
    newStyle.imageInsets = self.imageInsets;
    newStyle.imageRight = self.imageRight;
    newStyle.imageContentMode = self.imageContentMode;
    newStyle->_optionsSetted = self.optionsSetted;
    newStyle.title = self.title;
    return newStyle;
}

- (void)setImageContentMode:(UIViewContentMode)imageContentMode {
    _imageContentMode = imageContentMode;
    _optionsSetted |= OptionsSettedUseImageContentMode;
}
- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
    _optionsSetted |= OptionsSettedContentInset;
}

- (void)setTitleInsets:(UIEdgeInsets)titleInsets {
    _titleInsets = titleInsets;
    _optionsSetted |= OptionsSettedTitleInset;
}

- (void)setImageInsets:(UIEdgeInsets)imageInsets {
    _imageInsets = imageInsets;
    _optionsSetted |= OptionsSettedImageInset;
}

- (void)setSelectedTransform:(CGAffineTransform)selectedTransform {
    _selectedTransform = selectedTransform;
    _optionsSetted |= OptionsSettedTransformSelected;

}

- (void)setHighlightedTransform:(CGAffineTransform)highlightedTransform {
    _highlightedTransform = highlightedTransform;
    _optionsSetted |= OptionsSettedTransformHighlithed;
}

- (void)setDisabledTransform:(CGAffineTransform)disabledTransform {
    _disabledTransform = disabledTransform;
    _optionsSetted |= OptionsSettedTransformDisabled;
}

- (UIEdgeInsets)checkInsets:(UIEdgeInsets)insets {
    if (_imageRight) {
        insets.left*=-1;
        insets.right*=-1;
    }
    return insets;
}

- (UIEdgeInsets)imageInsets {
    return [self checkInsets:_imageInsets];
}

- (UIEdgeInsets)titleInsets {
    return [self checkInsets:_titleInsets];
}

- (UIEdgeInsets)contentInsets {
    return [self checkInsets:_contentInsets];
}

- (void)setFont:(UIFont *)font {
    _font = font;
}

- (NSDictionary<NSString *,id> *)textAttributes {
    return [self fixAtttributes:_textAttributes color:self.textColor];
}

- (NSDictionary<NSString *,id> *)hightLightedTextAttributes {
    return [self fixAtttributes:_hightLightedTextAttributes color:self.highlightedTextColor];
}

- (NSDictionary<NSString *,id> *)disabledTextAttributes {
    return [self fixAtttributes:_disabledTextAttributes color:self.disabledTextColor];
}

- (NSDictionary<NSString *,id> *)selectedTextAttributes {
    return [self fixAtttributes:_selectedTextAttributes color:self.selectedTextColor];
}

- (NSDictionary<NSString *,id> *)fixAtttributes:(NSDictionary<NSString *,id> *)sourceAttributes color:(UIColor*)color {
    NSMutableDictionary<NSString *,id> *attributes = sourceAttributes.mutableCopy;
    if (!attributes[NSFontAttributeName]) {
        attributes[NSFontAttributeName] = _font;
    }
    if (!attributes[NSForegroundColorAttributeName]) {
        attributes[NSForegroundColorAttributeName] = color;
    }

    return attributes;
}

@end
