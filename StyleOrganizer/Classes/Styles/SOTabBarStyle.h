//
//  SOTabBarStyle.h
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import "SOBaseStyle.h"

@interface SOTabBarStyle : SOBaseStyle

@property (nonatomic,strong) UIImage *shadowImage;
@property (nonatomic,strong) UIFont  *font;
@property (nonatomic,strong) UIColor *selectedTextColor;
@property (nonatomic,strong) UIColor *unselectedTextColor;
@property (nonatomic,strong) UIColor *selectedImageColor;
@property (nonatomic,strong) UIColor *barTintColor;
@property (nonatomic,strong) UIColor *unselectedImageColor;
@property(nonatomic) UIBarStyle barStyle;

@property (nonatomic) BOOL translucent;
@property (nonatomic) BOOL hideIcons;

@end
