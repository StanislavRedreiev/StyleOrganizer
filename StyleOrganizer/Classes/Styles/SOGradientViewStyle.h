//
//  GradientViewStyle.h
//  Style Organizer
//
//  Created by super team on 28.02.2018.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOViewStyle.h"

@interface SOGradientViewStyle : SOViewStyle

@property (nonatomic, strong) NSArray <UIColor *> *colors;
@property (nonatomic, strong) NSArray <NSNumber *> *locations;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGFloat angle;

@end
