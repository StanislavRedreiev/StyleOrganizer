//
//  RM.m
//  Style Organizer
//
//  Created by super team on 21.04.16.
//
//

#import "SONavigationBar.h"
#import "SONavigationBarStyle.h"
#import "UIView+SOStyleReloader.h"
#import "UIImage+ImageWithColor.h"
#import "SOStylishComponent.h"
#import "SOBarButtonItem.h"
#import <objc/runtime.h>

@interface SONavigationBar () <SOStylishComponent>

@property (nonatomic,strong) UINavigationItem *backItemIternal;
@property (nonatomic) BOOL dontStealTouches;

@property (nonatomic) BOOL useCustomNavigationBackground;
@property (nonatomic, strong) UIVisualEffectView *backgroundViewInternal;
@property (nonatomic, strong) NSLayoutConstraint *backgroundViewInternalTop;

@end

@implementation SONavigationBar

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName {
    self = [self initWithFrame:frame];
    if (self) {
        self.style = styleName;
        [self reloadStyle];
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

- (void)setupBackgroundViewInternal {
    if (!self.useCustomNavigationBackground) {
        self.backgroundViewInternal.alpha = 0.0f;
        return;
    }
    
    if (!_backgroundViewInternal) {
        self.backgroundViewInternal = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    }
    if (!self.backgroundViewInternal.superview) {
        [self insertSubview:self.backgroundViewInternal atIndex:0];
        self.backgroundViewInternal.translatesAutoresizingMaskIntoConstraints = NO;
        [self.backgroundViewInternal.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [self.backgroundViewInternal.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        self.backgroundViewInternalTop = [self.backgroundViewInternal.topAnchor constraintEqualToAnchor:self.topAnchor];
        self.backgroundViewInternalTop.active = YES;
        [self.backgroundViewInternal.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    }
    
    self.backgroundViewInternalTop.constant = -[self.window convertPoint:CGPointZero fromView:self].y;
    [self sendSubviewToBack:self.backgroundViewInternal];
}

- (void)setNavigationBackgroundHidden:(BOOL)hidden animated:(BOOL)animated {
    [UIView animateWithDuration:animated ? 0.25f : 0.0f animations:^{
//        [self.backgroundViewInternal setEffect:hidden ? [UIBlurEffect new] : [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        self.backgroundViewInternal.alpha = hidden ? 0.0f : 1.0f;
    }];
}

- (void)dealloc {
    [self unsubscribeSelfForStyle];
}

- (void)setStyle:(NSString *)style {
    if (_style != style) {    
        _style = style;
        [self reloadStyle];
    }
}

- (void)applyStyle:(SONavigationBarStyle *)style {

    if (style.optionsSetted & OptionsSettedTranslucent) {
        self.translucent = style.translucent;
    }
    if (style.backgroundColor) {
        UIImage *bgImage = [style.backgroundColor isEqual:[UIColor clearColor]] ? UIImage.new  : [UIImage imageWithColor:style.backgroundColor];
        [self setBackgroundImage:bgImage
                  forBarPosition:UIBarPositionAny
                      barMetrics:UIBarMetricsDefault];
    } else {
        [self setBackgroundImage:nil
                   forBarMetrics:UIBarMetricsDefault];
    }
    
    self.barStyle = style.barStyle;
    if (style.tintColor) {
        self.tintColor = style.tintColor;
    }
    if (style.shadowColor) {
        style.shadowImage = [UIImage imageWithColor:style.shadowColor];
    }
    if (style.shadowImage) {
        [self setShadowImage:style.shadowImage];
    }
    if (style.barTintColor) {
        self.barTintColor = style.barTintColor;
    }
    if (style.font) {
        NSMutableDictionary<NSString*,id> *textAttributes = [NSMutableDictionary new];
        textAttributes[NSFontAttributeName] = style.font;
        textAttributes[NSForegroundColorAttributeName] = style.textColor;
        [self setTitleTextAttributes:textAttributes];
    }
    self.dontStealTouches = style.dontStealTouches;
    self.useCustomNavigationBackground = style.useCustomNavigationBackground;
    
    if (style.useCustomNavigationBackground) {
        self.translucent = YES;
        [self setBackgroundImage:UIImage.new
                  forBarPosition:UIBarPositionAny
                      barMetrics:UIBarMetricsDefault];
        [self setShadowImage:UIImage.new];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupBackgroundViewInternal];
    if (@available(iOS 11,*)) {
        return;
    }
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stopFirst) {
        for (UIView *subview in view.subviews) {
            if ([subview isKindOfClass:UIImageView.class]) {
                if (subview.frame.size.height<2) {
                    [subview removeFromSuperview];
                    *stopFirst = YES;
                    break;
                }
            }
        }
    }];
}

- (UIView*)hitTest:(CGPoint)point
         withEvent:(UIEvent *)event {
    UIView *v = [super hitTest:point withEvent:event];
    if ([v isKindOfClass:[UIControl class]] || !self.dontStealTouches) {
        return v;
    }
    return nil;
}

@end
