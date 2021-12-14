//
//  SOBlurredStylishButton.h
//  Style Organizer
//
//  Created by super team on 15.01.2018.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOStylishRoundedButton.h"
#import "SOBlurButtonStyle.h"

IB_DESIGNABLE @interface SOBlurredStylishButton : SOStylishRoundedButton

@property (nonatomic) UIBlurEffectStyle blurStyle;
@property (nonatomic) BOOL vibrant;

@end
