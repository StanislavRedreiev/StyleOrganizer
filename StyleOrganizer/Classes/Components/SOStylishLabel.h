//
//  SOStylishLabel.h
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOLabelStyle.h"

@interface SOStylishLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;
- (void)commonInit;

@property(nonatomic, strong) IBInspectable NSString *style;
@property(nonatomic, strong) IBInspectable NSString *disabledStyle;

- (void)applyStyle:(SOLabelStyle *)style;

@end
