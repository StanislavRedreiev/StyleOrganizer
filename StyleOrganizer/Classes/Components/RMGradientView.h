//
//  GradientView.h
//  Devents
//
//  Created by Eugene Zhuk on 2/6/18.
//  Copyright © 2018 Ignited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+RMStyleReloader.h"
#import "SOStylishComponent.h"
#import "RMGradientViewStyle.h"

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
