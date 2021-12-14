//
//  SOProgressViewStyle.h
//  Style Organizer
//
//  Created by Max on 22.12.16.
//
//

#import "SOViewStyle.h"

@interface SOProgressViewStyle : SOViewStyle

@property(nonatomic)  UIProgressViewStyle progressViewStyle;
@property(nonatomic, strong, nullable) UIColor* progressTintColor;
@property(nonatomic, strong, nullable) UIColor* trackTintColor;
@property(nonatomic, strong, nullable) UIImage* progressImage;
@property(nonatomic, strong, nullable) UIImage* trackImage;

@end
