//
//  RMBaseStyle.h
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, OptionsSetted) {
    OptionsSettedShadowOffset = 1 << 0,
    OptionsSettedShadowRadius = 1 << 1,
    OptionsSettedShadowOpacity = 1 << 2,
    OptionsSettedCornerRadius = 1 << 3,
    OptionsSettedBorderWidth = 1 << 4,
    OptionsSettedMaskToBounds = 1 << 5,
    OptionsSettedRenderingMode = 1 << 6,
    OptionsSettedTranslucent = 1 << 7,
    OptionsSettedTransform  = 1 << 8,
};

static const int OptionsSettedStartPoint      = 2 << 10;
static const int OptionsSettedEndPoint        = 2 << 11;

@interface SOBaseStyle : NSObject <NSCopying>
{
    @protected
    OptionsSetted _optionsSetted;
}
- (instancetype)copyWithZone:(NSZone *)zone;
@property(nonatomic)  UIViewContentMode contentMode;
@property(nonatomic) BOOL maskToBounds;
@property(nonatomic) BOOL halfSizeCornereRadius;
@property(nonatomic, strong) UIColor *backgroundColor;
@property(nonatomic, strong) UIImage *backgroundImage;
@property(nonatomic, assign) CGFloat borderWidth;
@property(nonatomic, assign) CGFloat cornerRadius;
@property(nonatomic, strong) UIColor *borderColor;
@property(nonatomic, strong) UIColor *tintColor;
@property(nonatomic, strong)  UIColor* shadowColor;
@property(nonatomic) CGSize size;
@property(nonatomic) CGAffineTransform transform;
@property(nonatomic) CGSize shadowOffset;
@property(nonatomic) CGFloat shadowRadius;
@property(nonatomic) float shadowOpacity;
@property(readonly) OptionsSetted optionsSetted;
@property(nonatomic,readonly)  BOOL applyContentMode;

@end
