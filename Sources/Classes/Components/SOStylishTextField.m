
//
//  RMCorneredIconedTextField.m
//  Style Organizer
//
//  Created by super team on 20.03.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "StyleOrganizer.h"
#import "SOStylishTextField.h"
#import "SOTextFieldStyle.h"
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"
#import <objc/runtime.h>

@interface SOStylishTextField () <SOStylishComponent>

@property(atomic) CGRect imageRect;
@property(nonatomic) CGFloat padding;

@end

@implementation SOStylishTextField

- (instancetype)initWithFrame:(CGRect)frame
                     andStyle:(NSString *)styleName {
    self = [self initWithFrame:frame];
    if (self) {
        _style = styleName;
        [self reloadStyle];
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


- (void)dealloc {
    [self unsubscribeSelfForStyle];
}

- (void)commonInit {
    [self setPlaceholder:self.placeholder];
    [self subscribeSelfForStyle];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self updateLeftImageIfNeeded];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self updateLeftImageIfNeeded];
}

- (void)updateLeftImageIfNeeded {
    if (self.leftImageName) {
        [self layoutIfNeeded];
        UIImage *leftImage;
#if !TARGET_INTERFACE_BUILDER
        leftImage = [UIImage imageNamed:self.leftImageName];
#else
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        leftImage = [UIImage imageNamed:self.leftImageName
                               inBundle:bundle
          compatibleWithTraitCollection:self.traitCollection];
#endif
        [self setLeftImage:leftImage];
    }
}

- (void)setPlaceholder:(NSString *)placeholder {
    if (placeholder) {
        NSMutableDictionary* attributes = [NSMutableDictionary <NSString*,id> new];
        attributes[NSForegroundColorAttributeName] = [self placeholderColor];
        attributes[NSFontAttributeName] = [self placeholderFont];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    }
    
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    
    CGRect inset = CGRectMake(
                              bounds.origin.x + [self widthForLeftView], bounds.origin.y,
                              bounds.size.width - [self widthForRightView] - [self widthForLeftView],
                              bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (CGFloat)widthForRightView {
    return [self widthForView:self.rightView];
}

- (CGFloat)widthForLeftView {
    return [self widthForView:self.leftView];
}

- (CGFloat)widthForView:(UIView *)view {
    {
        if (!view || !view.frame.size.width) {
            return self.padding;
        }
        return view.frame.size.width;
    }
}

- (UIColor *)placeholderColor {
    if (self.myPlaceholderColor)
        return self.myPlaceholderColor;
    return [UIColor redColor];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.myPlaceholderColor = placeholderColor;
    [self setPlaceholder:[self.attributedPlaceholder string]];
}

- (void)setPlaceholderFont:(UIFont *)font {
    _placeholderFont = font;
    [self setPlaceholder:[self.attributedPlaceholder string]];
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    [self.leftView setTintColor:tintColor];
}

- (void)setLeftImage:(UIImage *)image {
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imageView = [[UIImageView alloc]
                              initWithFrame:CGRectMake(0, 0, self.frame.size.height,
                                                       self.frame.size.height)];
    [imageView setImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    self.leftView = imageView;
    self.leftView.tintColor = self.tintColor;
    self.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - Style

- (void)setStyle:(NSString *)style {
    _style = style;
    [self reloadStyle];
}

- (void)applyStyle:(SOTextFieldStyle *)style {
    [self applyBaseStyle:style];
    if (style.backgroundColor) {
        self.backgroundColor = style.backgroundColor;
    }
    if (style.placeholder) {
        self.placeholder = style.placeholder;
    }
    if (style.text) {
        self.text = style.text;
    }
    if (style.font) {
        self.font = style.font;
    }
    if (style.textColor) {
        self.textColor = style.textColor;
    }
    if (style.placeholderColor) {
        [self setPlaceholderColor:style.placeholderColor];
    }
    if (style.textAlignment) {
        self.textAlignment = style.textAlignment;
    }
    if (style.clearsOnBeginEditing) {
        self.clearsOnBeginEditing = style.clearsOnBeginEditing;
    }
    if (style.borderStyle) {
        self.borderStyle = style.borderStyle;
    }
    if (style.clearButtonMode) {
        self.clearButtonMode = style.clearButtonMode;
    }
    if (style.secureTextEntry) {
        self.secureTextEntry = style.secureTextEntry;
    }
    if (style.returnKeyType) {
        self.returnKeyType = style.returnKeyType;
    }
    if (style.leftImage) {
        [self setLeftImage:style.leftImage];
    }
    if (style.placeholderFont) {
        self.placeholderFont = style.placeholderFont;
    }
    self.padding = style.padding;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

@end
