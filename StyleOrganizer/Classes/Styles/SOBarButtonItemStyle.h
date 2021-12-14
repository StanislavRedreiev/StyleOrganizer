//
//  SOBarButtonItemStyle.h
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import "SOBaseStyle.h"


@interface SOBarButtonItemStyle : NSObject

//if not image the will use title attributes
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIColor *tintColor;
@property (nonatomic,strong) UIColor *disabledTextColor;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIFont *font;
@property (nonatomic) CGAffineTransform transform NS_UNAVAILABLE;

@end
