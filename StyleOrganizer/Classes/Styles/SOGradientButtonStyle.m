//
//  SOGradientButtonStyle.m
//  AFNetworking
//
//  Created by super team on 05.09.2018.
//

#import "SOGradientButtonStyle.h"

@implementation SOGradientButtonStyle

- (void)setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    _optionsSetted |= OptionsSettedStartPoint;
    
}
- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    _optionsSetted |= OptionsSettedEndPoint;
}

- (void)setAngle:(CGFloat)angle {
    CGFloat s = (angle - 90.0) / 360.0;
    CGFloat a = pow(sinf(2.0 * M_PI * ((s + 0.75) / 2.0)), 2.0);
    CGFloat b = pow(sinf(2.0 * M_PI * ((s + 0.0) / 2.0)), 2.0);
    [self setStartPoint:CGPointMake(a, b)];
    
    CGFloat e = (angle - 90.0) / 360.0;
    CGFloat c = pow(sinf(2.0 * M_PI * ((e + 0.25) / 2.0)), 2.0);
    CGFloat d = pow(sinf(2.0 * M_PI * ((e + 0.5) / 2.0)), 2.0);
    [self setEndPoint:CGPointMake(c, d)];
}

@end
