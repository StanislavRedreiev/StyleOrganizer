//
//  SOBarButtonItem.h
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOBarButtonItem : UIBarButtonItem

@property(nonatomic, strong) IBInspectable NSString *styleName;
- (instancetype)initWittStyleName:(NSString*)styleName;

@end
