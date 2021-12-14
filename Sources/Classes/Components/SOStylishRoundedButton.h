//
//  SOStylishRoundedButton.h
//  Style Organizer
//
//  Created by super team on 27.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

@import UIKit;
#import "SOButtonStyle.h"

IB_DESIGNABLE @interface  SOStylishRoundedButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;
- (void)commonInit;

@property(nonatomic, strong) IBInspectable NSString *style;
- (void)applyStyle:(SOButtonStyle *)style;

@end
