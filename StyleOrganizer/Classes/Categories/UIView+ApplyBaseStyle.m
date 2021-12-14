//
//  UIView+ApplyBaseStyle.m
//  Style Organizer
//
//  Created by super team on 12.05.16.
//
//

#import "UIView+ApplyBaseStyle.h"
#import <objc/runtime.h>

@implementation UIView (ApplyBaseStyle)

static const NSString *halfSizeCornereRadiusKey = @"halfSizeCornereRadius";
static const NSString *highPriorityWidthConstraintKey = @"highPriorityWidthConstraint";
static const NSString *highPriorityHeightConstraintKey = @"highPriorityHeightConstraint";

#pragma mark - Associated Objects

- (void)setUsingHalfSizeCornerRadius:(BOOL)usingHalfSizeCornerRadius {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(halfSizeCornereRadiusKey), @(usingHalfSizeCornerRadius), OBJC_ASSOCIATION_RETAIN);
    if (usingHalfSizeCornerRadius) {
        [self setNeedsLayout];
    }
}

- (BOOL)usingHalfSizeCornerRadius {
    id propertyValue = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(halfSizeCornereRadiusKey));
    return [propertyValue boolValue];
}

- (void)setHighPriorityWidthConstraint:(NSLayoutConstraint *)highPriorityWidthConstraint {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(highPriorityWidthConstraintKey), highPriorityWidthConstraint, OBJC_ASSOCIATION_RETAIN);
}


- (NSLayoutConstraint *)highPriorityWidthConstraint {
    id propertyValue = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(highPriorityWidthConstraintKey));
    if ([propertyValue isKindOfClass:[NSLayoutConstraint class]]) {
        return propertyValue;
    }
    return nil;
}

- (void)setHighPriorityHeightConstraint:(NSLayoutConstraint *)highPriorityHeighConstraint {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(highPriorityHeightConstraintKey), highPriorityHeighConstraint, OBJC_ASSOCIATION_RETAIN);
}

- (NSLayoutConstraint *)highPriorityHeightConstraint {
    id propertyValue = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(highPriorityHeightConstraintKey));
    if ([propertyValue isKindOfClass:[NSLayoutConstraint class]]) {
        return propertyValue;
    }
    return nil;
}

- (void)applyBaseStyle:(SOBaseStyle *)style {
    self.usingHalfSizeCornerRadius = style.halfSizeCornereRadius;
    if (style.optionsSetted & OptionsSettedCornerRadius) {
        self.layer.cornerRadius = style.cornerRadius;
        self.layer.masksToBounds = YES;
    }
    if (style.optionsSetted & OptionsSettedBorderWidth) {
        self.layer.borderWidth = style.borderWidth;
    }
    if (style.borderColor) {
        self.layer.borderColor = style.borderColor.CGColor;
    }
    if (style.tintColor) {
        self.tintColor = style.tintColor;
    }
    if (style.optionsSetted & OptionsSettedMaskToBounds) {
        self.layer.masksToBounds = style.maskToBounds;
    }
    if (style.shadowColor) {
        self.layer.shadowColor = style.shadowColor.CGColor;
    }
    if (style.optionsSetted & OptionsSettedShadowOffset) {
        self.layer.shadowOffset = style.shadowOffset;
    }
    if (style.optionsSetted & OptionsSettedShadowOpacity) {
        self.layer.shadowOpacity = style.shadowOpacity;
    }
    if (style.optionsSetted & OptionsSettedShadowRadius) {
        self.layer.shadowRadius = style.shadowRadius;
    }
    if (style.optionsSetted & OptionsSettedTransform) {
        self.transform = style.transform;
    }
    if (style.applyContentMode) {
        self.contentMode = style.contentMode;
    }
    [self setViewSizeHighPriority:style.size];
}

- (void)setViewSizeHighPriority:(CGSize)size {
    if (self.constraints.count || !self.translatesAutoresizingMaskIntoConstraints) {
        if (size.height) {
            if (!self.highPriorityHeightConstraint) {
                NSLayoutConstraint *highPriorityHeightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:size.height];
                highPriorityHeightConstraint.priority = UILayoutPriorityDefaultHigh;
                [self addConstraint:highPriorityHeightConstraint];
                self.highPriorityHeightConstraint = highPriorityHeightConstraint;
            } else {
                self.highPriorityHeightConstraint.constant = size.height;
            }
        }
        if (size.width) {
            if (!self.highPriorityWidthConstraint) {
                NSLayoutConstraint * highPriorityWidthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:size.width];
                highPriorityWidthConstraint.priority = UILayoutPriorityDefaultHigh;
                [self addConstraint:highPriorityWidthConstraint];
                self.highPriorityWidthConstraint = highPriorityWidthConstraint;

            } else {
                self.highPriorityWidthConstraint.constant = size.width;
            }
        }
    } else {
        if (!CGSizeEqualToSize(size, CGSizeZero)) {
            CGRect bounds = self.bounds;
            if (size.width) {
                bounds.size.width = size.width;
            }
            if (size.height) {
                bounds.size.height = size.height;
            }
            self.bounds = bounds;
        }
    }
}



+ (NSDictionary*)textAttributesWithTextAttributes:(NSDictionary*)textAttributes textColor:(UIColor*)textColor {
    if (textColor && textAttributes && !textAttributes[NSForegroundColorAttributeName]) {
        NSMutableDictionary *mutableTextAttributes = [textAttributes mutableCopy];
        mutableTextAttributes[NSForegroundColorAttributeName] = textColor;
        return [mutableTextAttributes copy];
    }
    return textAttributes;
}

- (void)onLayoutSubviews {
    if (self.usingHalfSizeCornerRadius) {
        self.layer.cornerRadius = MIN(self.bounds.size.width,self.bounds.size.height)/2.f;
    }
    
    if (self.layer.shadowOpacity > 0.0 && self.layer.cornerRadius > 0.0) {
        self.layer.masksToBounds = false;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    }
}

@end
