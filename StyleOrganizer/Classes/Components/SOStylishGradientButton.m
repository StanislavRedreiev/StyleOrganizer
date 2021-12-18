//
//  SOStylishGradientButton.m
//  AFNetworking
//
//  Created by super team on 05.09.2018.
//

#import "SOStylishGradientButton.h"
#import "SOGradientButtonStyle.h"

@interface SOStylishGradientButton ()

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, strong) NSArray<UIColor *> *colors;
@property (nonatomic, strong) NSArray<NSNumber *> *locations;

@end

@implementation SOStylishGradientButton

- (void)applyStyle:(SOGradientButtonStyle*)style {
    [super applyStyle:style];
    self.startPoint = style.optionsSetted & OptionsSettedStartPoint ?  style.startPoint : CGPointZero;
    self.endPoint = style.optionsSetted & OptionsSettedStartPoint ?  style.endPoint : CGPointMake(1, 1);
    self.colors = style.colors;
    self.locations = style.locations.count>1 ? style.locations : @[@0,@1];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!self.colors.count) {
        return;
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSMutableArray *gradientColors = NSMutableArray.new;
    [self.colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [gradientColors addObject:(id) obj.CGColor];
    }];
    
    CGFloat gradientLocations[self.locations.count];
    for (NSInteger i=0; i<self.locations.count; i++) {
        gradientLocations[i] = self.locations[i].doubleValue;
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) gradientColors, gradientLocations);
    
    // normalize values
    _startPoint = (CGPoint){MIN(1, ABS(_startPoint.x)), MIN(1, ABS(_startPoint.y))};
    _endPoint = (CGPoint){MIN(1, ABS(_endPoint.x)), MIN(1, ABS(_endPoint.y))};
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGPoint startPoint = CGPointMake(_startPoint.x * width, _startPoint.y * height);
    CGPoint endPoint = CGPointMake(_endPoint.x * width, _endPoint.y * height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
