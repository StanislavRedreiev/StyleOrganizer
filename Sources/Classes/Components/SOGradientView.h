//
//  GradientView.h
//  Style Organizer
//
//  Created by Eugene Zhuk on 2/6/18.
//  Copyright © 2018 super team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"
#import "SOGradientViewStyle.h"

IB_DESIGNABLE @interface SOGradientView : UIView  <SOStylishComponent>

- (instancetype)initWithFrame:(CGRect)frame
                     andStyle:(NSString *)styleName;
@property (nonatomic, strong) IBInspectable NSString *style;
@property (nonatomic, strong) IBInspectable UIColor *startColor;
@property (nonatomic, strong) IBInspectable UIColor *endColor;
@property (nonatomic, strong) NSArray <UIColor *> *colors;
@property (nonatomic, assign) NSArray<NSNumber *> *locations;
@property (nonatomic, readonly) CAGradientLayer *gradientLayer;
- (void)applyStyle:(SOGradientViewStyle *)stylel;


@end
