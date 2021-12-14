//
//  SOStylishComponent.h
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

@class SOBaseStyle;

#import <Foundation/Foundation.h>
#import "UIView+ApplyBaseStyle.h"

@protocol SOStylishComponent <NSObject>


- (void)applyStyle:(__kindof SOBaseStyle *)style;
- (void)applyBaseStyle:(__kindof SOBaseStyle *)style;
@optional
- (void)setStyle:(NSString *)style;
- (NSString *)style;
- (void)setStyleName:(NSString *)styleName;
- (NSString *)styleName;
@end
