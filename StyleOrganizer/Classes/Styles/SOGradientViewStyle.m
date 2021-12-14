//
//  GradientViewStyle.m
//  Style Organizer
//
//  Created by super team on 28.02.2018.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOGradientViewStyle.h"

@implementation SOGradientViewStyle

- (id)copyWithZone:(NSZone *)zone {
    SOGradientViewStyle *style = [super copyWithZone:zone];
    style.colors = self.colors;
    style.locations = self.locations;
    style.startPoint = self.startPoint;
    style.endPoint = self.endPoint;
    style->_optionsSetted = self.optionsSetted;
    return style;
}

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
    _startPoint = CGPointMake(a, b);
    
    CGFloat e = (angle - 90.0) / 360.0;
    CGFloat c = pow(sinf(2.0 * M_PI * ((e + 0.25) / 2.0)), 2.0);
    CGFloat d = pow(sinf(2.0 * M_PI * ((e + 0.5) / 2.0)), 2.0);
    _endPoint = CGPointMake(c, d);
}

@end
