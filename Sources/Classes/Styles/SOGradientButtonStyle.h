//
//  SOGradientButtonStyle.h
//  AFNetworking
//
//  Created by super team on 05.09.2018.
//

#import "SOButtonStyle.h"
#import "SOGradientViewStyle.h"

@interface SOGradientButtonStyle : SOButtonStyle

@property (nonatomic,strong) NSArray <UIColor *> *colors;
@property (nonatomic,strong) NSArray <NSNumber *> *locations;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGFloat angle;

@end
