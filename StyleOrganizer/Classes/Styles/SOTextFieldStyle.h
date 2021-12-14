//
//  SOTextFieldStyle.h
//  Style Organizer
//
//  Created by super team on 4/16/16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOBaseStyle.h"

@interface SOTextFieldStyle : SOBaseStyle

@property(nonatomic, strong) NSString *placeholder;
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIColor *placeholderColor;
@property(nonatomic, strong) UIFont *placeholderFont;

@property(nonatomic, assign) NSTextAlignment textAlignment;
@property(nonatomic, assign) BOOL clearsOnBeginEditing;
@property(nonatomic, assign) UITextBorderStyle borderStyle;
@property(nonatomic, assign) UITextFieldViewMode clearButtonMode;
@property(nonatomic, assign) BOOL secureTextEntry;
@property(nonatomic, assign) UIReturnKeyType returnKeyType;
@property(nonatomic, strong) UIImage *leftImage;
@property(nonatomic) CGFloat padding;

@end
