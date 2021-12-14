//
//  SOButtonStyle.h
//  Style Organizer
//
//  Created by super team on 27.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOBaseStyle.h"

static const int OptionsSettedContentInset          = 1 << 10;
static const int OptionsSettedImageInset            = 1 << 11;
static const int OptionsSettedTitleInset            = 1 << 12;
static const int OptionsSettedTransformDisabled     = 1 << 13;
static const int OptionsSettedTransformHighlithed   = 1 << 14;
static const int OptionsSettedTransformSelected     = 1 << 15;
static const int OptionsSettedUseImageContentMode   = 1 << 16;

@interface SOButtonStyle: SOBaseStyle

@property(nonatomic, strong) UIFont *font;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIColor *highlightedBgColor;
@property(nonatomic, strong) UIColor *highlightedBorderColor;
@property(nonatomic, strong) UIColor *selectedBorderColor;
@property(nonatomic, strong) UIColor *highlightedTextColor;
@property(nonatomic, strong) UIColor *highlightedTintColor;
@property(nonatomic, strong) UIColor *selectedTintColor;
@property(nonatomic, strong) UIColor *disabledTintColor;
@property(nonatomic, strong) UIColor *disabledBgColor;
@property(nonatomic, strong) UIColor *selectedBgColor;
@property(nonatomic, strong) UIColor *disabledTextColor;
@property(nonatomic, strong) UIColor *selectedTextColor;
@property(nonatomic, strong) NSDictionary<NSString *, id> * textAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * hightLightedTextAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * disabledTextAttributes;
@property(nonatomic, strong) NSDictionary<NSString *, id> * selectedTextAttributes;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *selectedImage;
@property(nonatomic, strong) UIImage *disabledImage;
@property(nonatomic, strong) UIImage *higlithedImage;
@property(nonatomic, strong) NSString *title;

@property(nonatomic) UIImageRenderingMode renderingMode;
@property(nonatomic, strong) UIColor *disabledBorderColor;
@property(nonatomic) UIEdgeInsets contentInsets;
@property(nonatomic) UIEdgeInsets titleInsets;
@property(nonatomic) UIEdgeInsets imageInsets;
@property(nonatomic) UIViewContentMode imageContentMode;
@property(nonatomic) CGAffineTransform selectedTransform;
@property(nonatomic) CGAffineTransform disabledTransform;
@property(nonatomic) CGAffineTransform highlightedTransform;
@property(nonatomic) BOOL imageRight;

@end
