//
//  SOStylishTabBar.h
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOStylishTabBar : UITabBar

- (instancetype)initWithFrame:(CGRect)frame
                     andStyle:(NSString *)styleName;
@property(nonatomic, strong) IBInspectable NSString *style;

@end
