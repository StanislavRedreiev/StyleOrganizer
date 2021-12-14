
//
//  SOStylishRoundedButton.m
//  Style Organizer
//
//  Created by super team on 27.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOButtonStyle.h"
#import "StyleOrganizer.h"
#import "SOStylishRoundedButton.h"
#import "UIImage+ImageWithColor.h"
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"
#import "UIColor+InputMethods.h"

@interface SOStylishRoundedButton () <SOStylishComponent>

@property (nonatomic) BOOL isRight;

@property(nonatomic, strong) NSDictionary<NSString *, id> * textAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * hightLightedTextAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * disabledTextAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * selectedTextAttributes;

@property (nonatomic,strong) UIColor *backgroundColorNormal;
@property (nonatomic,strong) UIColor *backgroundColorDisabled;
@property (nonatomic,strong) UIColor *backgroundColorHighlithed;
@property (nonatomic,strong) UIColor *backgroundColorSelected;


@property(nonatomic, strong) UIColor *borderColor;
@property(nonatomic, strong) UIColor *highlightedBorderColor;
@property(nonatomic, strong) UIColor *disabledBorderColor;
@property(nonatomic, strong) UIColor *selectedBorderColor;
@property(nonatomic, strong) NSValue/*CGAffineTransform*/* selectedTransform;
@property(nonatomic, strong) NSValue/*CGAffineTransform*/* disabledTransform;
@property(nonatomic, strong) NSValue/*CGAffineTransform*/* highlightedTransform;
@property(nonatomic, strong) NSValue/*CGAffineTransform*/* defaultTransform;
@property(nonatomic, strong) NSMutableDictionary<NSNumber*,NSString*> * titlesForStates;
@property(nonatomic, strong) NSMutableDictionary<NSNumber*,UIColor*> * colorsForStates;

@end

@implementation SOStylishRoundedButton
@synthesize selectedTransform = _selectedTransform;
@synthesize disabledTransform = _disabledTransform;
@synthesize highlightedTransform = _highlightedTransform;
@synthesize defaultTransform = _defaultTransform;

- (NSMutableDictionary<NSNumber *,NSString *> *)titlesForStates {
    if (!_titlesForStates) {
        _titlesForStates = [NSMutableDictionary new];
    }
    return _titlesForStates;
}

- (instancetype)initWithFrame:(CGRect)frame
                     andStyle:(NSString *)styleName {
    self = [self initWithFrame:frame];
    if (self) {
        self.style = styleName;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self subscribeSelfForStyle];
}

- (void)dealloc {
    [self unsubscribeSelfForStyle];
}

- (void)setStyle:(NSString *)style {
    _style = style;
    [self reloadStyle];
}

- (void)applyStyle:(SOButtonStyle *)style {
    [self applyBaseStyle:style];
    if (style.font) {
        self.titleLabel.font = style.font;
    }
    
    if (style.title) {
        [self setTitle:style.title forState:UIControlStateNormal
              internal:NO];
    }
    if (style.image) {
        UIImage *image = style.image;
        if (style.optionsSetted & OptionsSettedRenderingMode ) {
            image = [image imageWithRenderingMode:style.renderingMode];
        }
        [self setImage:image forState:UIControlStateNormal];
    }
    if (style.textColor) {
        [self setTitleColor:style.textColor
                   forState:UIControlStateNormal];
    }
    if (style.backgroundColor) {
        self.backgroundColor = style.backgroundColor;
        self.backgroundColorNormal = style.backgroundColor;
    }
    if (style.borderColor) {
        self.borderColor = style.borderColor;
    }
    if (style.disabledTextColor) {
        [self setTitleColor:style.disabledTextColor
                   forState:UIControlStateDisabled];
    }
    if (style.disabledBgColor) {
        self.backgroundColorDisabled = style.disabledBgColor;
    }
    if (style.disabledBorderColor) {
        self.disabledBorderColor = style.disabledBorderColor;
    }
    if (style.highlightedTextColor) {
        [self setTitleColor:style.highlightedTextColor
                   forState:UIControlStateHighlighted];
    }
    if (style.highlightedBgColor) {
        self.backgroundColorHighlithed = style.highlightedBgColor;
    }
    if (style.highlightedBorderColor) {
        self.highlightedBorderColor = style.highlightedBorderColor;
    }
    if (style.selectedTextColor) {
        [self setTitleColor:style.selectedTextColor
                   forState:UIControlStateSelected];
    }
    if (style.selectedBgColor) {
        self.backgroundColorSelected = style.selectedBgColor;
    }
    if (style.selectedBorderColor) {
        self.selectedBorderColor = style.selectedBorderColor;
    }
    if (style.textAttributes) {
        self.textAttributes =  [self.class textAttributesWithTextAttributes:style.textAttributes textColor:style.textColor] ;
    }
    if (style.hightLightedTextAttributes) {
        self.hightLightedTextAttributes = [self.class textAttributesWithTextAttributes:style.hightLightedTextAttributes textColor:style.highlightedTextColor ? style.highlightedTextColor : style.textColor];
    }
    if (style.disabledTextAttributes) {
        self.disabledTextAttributes = [self.class textAttributesWithTextAttributes:style.disabledTextAttributes textColor:style.disabledTextColor ? style.disabledTextColor : style.textColor] ;
    }
    if (style.selectedTextAttributes) {
        self.selectedTextAttributes = [self.class textAttributesWithTextAttributes:style.selectedTextAttributes textColor:style.selectedTextColor ? : style.textColor];
    }
    [self reloadTitleForState:UIControlStateHighlighted];
    [self reloadTitleForState:UIControlStateDisabled];
    [self reloadTitleForState:UIControlStateSelected];
    if (style.higlithedImage) {
        [self setImage:style.higlithedImage forState:UIControlStateHighlighted];
    } else if (style.highlightedTintColor) {
        [self setImage:[style.image tintedImageWithColor:style.highlightedTintColor]  forState:UIControlStateHighlighted];
    }
    UIImage* higlithedImage = style.higlithedImage;
    if (style.disabledTintColor) {
        if (!higlithedImage) {
            higlithedImage = style.image;
        }
        higlithedImage = [higlithedImage tintedImageWithColor:style.highlightedTintColor];
    }
    if (higlithedImage) {
        [self setImage:higlithedImage forState:UIControlStateHighlighted];
    }
    UIImage* disabledImage = style.disabledImage;
    if (style.disabledTintColor) {
        if (!disabledImage) {
            disabledImage = style.image;
        }
        disabledImage = [disabledImage tintedImageWithColor:style.disabledTintColor];
    }
    if (disabledImage) {
        [self setImage:disabledImage forState:UIControlStateDisabled];
    }
    UIImage* selectedImage = style.selectedImage;
    if (style.selectedTintColor) {
        if (!selectedImage) {
            selectedImage = style.image;
        }
        selectedImage = [selectedImage tintedImageWithColor:style.selectedTintColor];
    }
    if (selectedImage) {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
    
    if (style.optionsSetted & OptionsSettedContentInset) {
        [self setContentEdgeInsets:style.contentInsets];
    }
    if (style.optionsSetted & OptionsSettedTitleInset) {
        [self setTitleEdgeInsets:style.titleInsets];
    }
    if (style.optionsSetted & OptionsSettedImageInset) {
        [self setImageEdgeInsets:style.imageInsets];
    }
    if (style.optionsSetted & OptionsSettedTransformDisabled) {
        self.disabledTransform = [NSValue valueWithCGAffineTransform:style.disabledTransform];
    }
    if (style.optionsSetted & OptionsSettedTransformHighlithed) {
        self.highlightedTransform = [NSValue valueWithCGAffineTransform:style.highlightedTransform];
    }
    if (style.optionsSetted & OptionsSettedTransformSelected) {
        self.selectedTransform = [NSValue valueWithCGAffineTransform:style.selectedTransform];
    }
    if (style.optionsSetted & OptionsSettedTransform) {
        self.defaultTransform = [NSValue valueWithCGAffineTransform:style.transform];
    } else {
        self.defaultTransform = [NSValue valueWithCGAffineTransform:CGAffineTransformIdentity];
    }
    if (style.selectedTextAttributes) {
        self.selectedTextAttributes = style.selectedTextAttributes;
    }
    if (style.optionsSetted & OptionsSettedUseImageContentMode) {
        self.imageView.contentMode = style.imageContentMode;
    }
    [self reloadTitleForState:UIControlStateNormal];
    [self reloadTitleForState:UIControlStateFocused];
    [self reloadTitleForState:UIControlStateSelected];
    [self reloadTitleForState:UIControlStateApplication];
    [self reloadTitleForState:UIControlStateReserved];
    [self reloadTitleForState:UIControlStateHighlighted];
    [self reloadTitleForState:UIControlStateDisabled];
    self.isRight = style.imageRight;
}

- (void)reloadTitleForState:(UIControlState)state {
    NSString *title =  self.titlesForStates[@(state)];
    [self setTitle:title forState:state internal:YES];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [self setTitle:title forState:state internal:NO];

}

- (void)setTitle:(NSString *)title forState:(UIControlState)state internal:(BOOL)internal {
    if (!internal) {
        self.titlesForStates[@(state)] = title;
    }
    NSDictionary *attributes;
    switch (state) {
        case UIControlStateDisabled:
            attributes = self.disabledTextAttributes;
            break;
        case UIControlStateSelected:
            attributes = self.selectedTextAttributes;
            break;
        case UIControlStateHighlighted:
            attributes = self.hightLightedTextAttributes;
            break;
        case UIControlStateNormal:
            attributes = self.textAttributes;
            break;
        default:
            attributes = nil;
            break;
    }
    if (attributes && title) {
        [self setAttributedTitle:[[NSAttributedString alloc] initWithString:title attributes:attributes] forState:state];
        
    } else {
        [super setTitle:title forState:state];
    }
    if (state == UIControlStateNormal) {
        NSArray <NSNumber*>* states = @[
                                        @(UIControlStateHighlighted),
                                        @(UIControlStateSelected),
                                        @(UIControlStateFocused),
                                        @(UIControlStateApplication),
                                        @(UIControlStateReserved),
                                        @(UIControlStateDisabled)
                                        ];
        [states enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIControlState state = obj.integerValue;
            if (!self.titlesForStates[obj]) {
                [self setTitle:title forState:state internal:YES];
            }
        }];
        
    }
   
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateState];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateState];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateState];
}

- (UIColor*)bgColorForState {
    UIColor *color;
    if (self.isHighlighted) {
        color = self.backgroundColorHighlithed;
    } else if (self.isSelected) {
        color = self.backgroundColorSelected;
    } else if (!self.isEnabled) {
        color = self.backgroundColorDisabled;
    } else {
        color = self.backgroundColorNormal;
    }
    return color;
}

- (UIColor*)borderColorForState {
    UIColor *color;
    if (self.isHighlighted) {
        color = self.highlightedBorderColor;
    } else if (self.isSelected) {
        color = self.selectedBorderColor;
    } else if (!self.isEnabled) {
        color = self.disabledBorderColor;
    } else {
        color = self.borderColor;
    }
    return color;
}

- (void)updateState {
    [self updateTransfrom];
    UIColor *color = [self borderColorForState];
    if (color) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = self.layer.borderWidth;
    }
    UIColor *bgColor = [self bgColorForState];
    if (bgColor) {
        self.backgroundColor = bgColor;
    }
}

- (void)setTransform:(CGAffineTransform)transform internal:(BOOL)internal {
    if (CGAffineTransformEqualToTransform(self.transform , transform)) {
        return;
    }
    if (!internal) {
        _defaultTransform = [NSValue valueWithCGAffineTransform:transform];
        [super setTransform:transform];
    } else {

        [UIView animateWithDuration:0.2f animations:^{
            [super setTransform:transform];
        }];
    }
}

- (UIColor *)highlightedBorderColor {
    if (_highlightedBorderColor) {
        return _highlightedBorderColor;
    }
    return _borderColor;
}
- (UIColor *)disabledBorderColor {
    if (_disabledBorderColor) {
        return _disabledBorderColor;
    }
    return _borderColor;
}

- (NSValue *)disabledTransform {
    if (_disabledTransform) {
        return _disabledTransform;
    }
    return [NSValue valueWithCGAffineTransform:self.transform];
}

- (NSValue *)highlightedTransform {
    if (_highlightedTransform) {
        return _highlightedTransform;
    }
    return [NSValue valueWithCGAffineTransform:self.transform];
}


- (NSValue *)selectedTransform {
    if (_selectedTransform) {
        return _selectedTransform;
    }
    return [NSValue valueWithCGAffineTransform:self.transform];
}

- (NSValue *)defaultTransform {
    if (_defaultTransform) {
        return _defaultTransform;
    }
    return [NSValue valueWithCGAffineTransform:self.transform];
}

- (CGAffineTransform)currentTransform {
    if (self.isHighlighted) {
        return self.highlightedTransform.CGAffineTransformValue;
    } else if (self.isSelected) {
        return self.selectedTransform.CGAffineTransformValue;
    } else if (!self.isEnabled) {
        return self.disabledTransform.CGAffineTransformValue;
    }
    return self.defaultTransform.CGAffineTransformValue;
}

- (void)updateTransfrom {
    [self setTransform: self.currentTransform internal:YES];
}

- (UIColor *)backgroundColorHighlithed {
    if (!_backgroundColorHighlithed) {
        return _backgroundColorNormal;
    }
    return _backgroundColorHighlithed;
}

- (UIColor *)backgroundColorDisabled {
    if (!_backgroundColorDisabled) {
        return _backgroundColorNormal;
    }
    return _backgroundColorDisabled;
}


- (UIColor *)backgroundColorSelected {
    if (!_backgroundColorSelected) {
        return _backgroundColorNormal;
    }
    return _backgroundColorSelected;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect frame = [super imageRectForContentRect:contentRect];
    if (self.isRight) {
        frame.origin.x = CGRectGetMaxX(contentRect) - CGRectGetWidth(frame) -  self.imageEdgeInsets.right + self.imageEdgeInsets.left;
    }
    return frame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect frame = [super titleRectForContentRect:contentRect];
    if (self.isRight) {
        frame.origin.x = CGRectGetMinX(frame) - CGRectGetWidth([self imageRectForContentRect:contentRect]);
    }
    return frame;
}

- (NSDictionary<NSString *,id> *)attributesFix:(NSDictionary<NSString *,id> *)source state:(UIControlState)state {
    if (source) {
        return source;
    }
    if (_textAttributes) {
        NSMutableDictionary<NSString *,id> * attributes = _textAttributes.mutableCopy;
        UIColor *color = [self titleColorForState:state];
        if (color) {
            attributes[NSForegroundColorAttributeName] = color;
        }
        return attributes.copy;
    }
    return nil;
}


- (NSDictionary<NSString *,id> *)selectedTextAttributes {
    return [self attributesFix:_selectedTextAttributes state:UIControlStateSelected];
}

- (NSDictionary<NSString *,id> *)hightLightedTextAttributes {
    return [self attributesFix:_hightLightedTextAttributes state:UIControlStateHighlighted];
}

- (NSDictionary<NSString *,id> *)disabledTextAttributes {
    return [self attributesFix:_disabledTextAttributes state:UIControlStateDisabled];
}

@end
