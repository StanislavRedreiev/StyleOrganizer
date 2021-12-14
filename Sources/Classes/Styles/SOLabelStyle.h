//
//  SOLabelStyle.h
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOBaseStyle.h"

@interface SOLabelStyle : SOBaseStyle

@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIColor *highlightedTextColor;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, strong) UIFont *highlightedFont;
@property(nonatomic, strong) UIColor *fontColor;
@property(nonatomic, assign) CGFloat fontSize;
@property(nonatomic, strong) NSDictionary<NSString *, id> * textAttributes;
@property(nonatomic, assign) NSTextAlignment textAlignment;
@property(nonatomic, assign) CGFloat numberOfLines;
@property(nonatomic) CGFloat kerning;
@property(nonatomic) CGFloat minimumFontScale;
@property(nonatomic) UIEdgeInsets insets;

@end
