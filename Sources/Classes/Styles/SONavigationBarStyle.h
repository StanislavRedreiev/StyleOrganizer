//
//  SONavigationBarStyle.h
//  Style Organizer
//
//  Created by super team on 21.04.16.
//
//

#import "SOBaseStyle.h"
#import "SOBarButtonItemStyle.h"

@interface SONavigationBarStyle : SOBaseStyle

@property(nonatomic) BOOL translucent;
@property(nonatomic) UIImage *shadowImage;
@property(nonatomic, strong) UIColor *barTintColor;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic) UIBarStyle barStyle;
@property(nonatomic) BOOL dontStealTouches;
@property(nonatomic) BOOL useCustomNavigationBackground;

@end
