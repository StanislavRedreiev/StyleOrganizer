//
//  SOStyleSwitch.h
//  Style Organizer
//
//  Created by super team on 03.02.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOStyleSwitch : UISwitch

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;

@property(nonatomic, strong) IBInspectable NSString *style;

@end
