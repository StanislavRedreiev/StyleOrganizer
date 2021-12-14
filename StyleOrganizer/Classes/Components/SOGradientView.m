//
//  GradientView.m
//  Style Organizer
//
//  Created by Eugene Zhuk on 2/6/18.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOGradientView.h"
#import "UIColor+InputMethods.h"

@interface SOGradientView ()
@end

@implementation SOGradientView
@synthesize colors = _colors;

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName {
    self = [self initWithFrame:frame];
    if (self) {
        self.style = styleName;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self subscribeSelfForStyle];
}

- (void)dealloc {
    [self unsubscribeSelfForStyle];
}

- (void)setStyle:(NSString *)style {
    _style = style;
    [self reloadStyle];
}

- (void)applyStyle:(SOGradientViewStyle *)style {
    [self applyBaseStyle:style];
    if (style.locations) {
        self.locations = style.locations;
    }
    if (style.colors) {
        self.colors = style.colors;
    }
    if (style.optionsSetted & OptionsSettedStartPoint) {
        self.gradientLayer.startPoint = style.startPoint;
    }
    if (style.optionsSetted & OptionsSettedEndPoint) {
        self.gradientLayer.endPoint = style.endPoint;
    }
    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

+ (Class)layerClass {
    return [CAGradientLayer class];
}

#pragma mark - setters/getters
- (CAGradientLayer *)gradientLayer {
    return (CAGradientLayer *)self.layer;
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    NSMutableArray *cgColors = [NSMutableArray new];
    
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [cgColors addObject:(id)obj.CGColor];
    }];
    self.gradientLayer.colors = cgColors;
}

- (void)setStartColor:(UIColor *)startColor {
    if (startColor == nil) {
        return;
    }
    self.gradientLayer.colors = [@[(id)startColor.CGColor] arrayByAddingObjectsFromArray:self.gradientLayer.colors];
}


- (UIColor *)startColor {
    return [UIColor colorWithCGColor:(CGColorRef)self.gradientLayer.colors.firstObject];
}

- (void)setEndColor:(UIColor *)endColor {
    if (endColor == nil) {
        return;
    }
    self.gradientLayer.colors = [self.gradientLayer.colors arrayByAddingObject:(id)endColor.CGColor];
}

- (UIColor *)endColor {
    return [UIColor colorWithCGColor:(CGColorRef)self.gradientLayer.colors.lastObject];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
//    if (self.colors.count == 0) {
//        [super setBackgroundColor:backgroundColor];
//    }
}

- (NSArray<NSNumber *> *)locations {
    return self.gradientLayer.locations;
}

- (void)setLocations:(NSArray<NSNumber *> *)locations {
    self.gradientLayer.locations = locations;
}

- (NSArray<UIColor *> *)colors {
    if (!_colors &&self.startColor && self.endColor) {
        return @[self.startColor,self.endColor];
    }
    return _colors;
}

@end
