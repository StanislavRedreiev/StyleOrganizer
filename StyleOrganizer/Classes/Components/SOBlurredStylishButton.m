//
//  SOBlurredStylishButton.m
//  Style Organizer
//
//  Created by super team on 15.01.2018.
//  Copyright © 2018 super team. All rights reserved.
//

#import "SOBlurredStylishButton.h"
#import "SOBlurButtonStyle.h"

@interface SOBlurredStylishButton ()

@property (nonatomic,strong) UIVisualEffectView *effectView;
@property (nonatomic,weak) UIVisualEffectView *vibrancyView;

@end

@implementation SOBlurredStylishButton

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (void)setVibrant:(BOOL)vibrant {
    if (_vibrant != vibrant) {
        _vibrant = vibrant;
        if (vibrant) {
            [self vibrancyView];
        } else {
            if (self.titleLabel) {
                [self insertSubview:self.titleLabel aboveSubview:self.effectView];
            }
            if (self.imageView) {
                [self insertSubview:self.imageView aboveSubview:self.effectView];
            }
            [self addSubview:self.titleLabel];
            [self.vibrancyView removeFromSuperview];
        }
    }
}

- (void)setBlurStyle:(UIBlurEffectStyle)blurStyle {
    _blurStyle = blurStyle;
    self.effectView.effect = [UIBlurEffect effectWithStyle:_blurStyle];
    _vibrancyView.effect = [self vibrancyEffect];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.effectView.frame = self.bounds;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect* containerEffect = [UIBlurEffect effectWithStyle:self.blurStyle];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:containerEffect];
        effectView.userInteractionEnabled = NO;
        effectView.frame = self.bounds;
        effectView.backgroundColor = [UIColor clearColor];
        _effectView = effectView;
        if (self.titleLabel) {
            [self insertSubview:effectView belowSubview:self.titleLabel];
        }
        if (self.imageView) {
            [self insertSubview:effectView belowSubview:self.imageView];
        }
    }
    return _effectView;
}

- (UIVibrancyEffect*)vibrancyEffect {
    UIBlurEffect *blurEffect = (UIBlurEffect*)self.effectView.effect;
    UIVibrancyEffect* vibrancy = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    return vibrancy;
}

- (UIVisualEffectView *)vibrancyView {
    if (!_vibrancyView) {
        UIVisualEffectView* vibrancyView = [[UIVisualEffectView alloc] initWithEffect:[self vibrancyEffect]];
        vibrancyView.frame = self.effectView.bounds;
        vibrancyView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
        vibrancyView.userInteractionEnabled = NO;
        [self.effectView.contentView addSubview:vibrancyView];
        if (self.titleLabel) {
            [vibrancyView.contentView addSubview:self.titleLabel];
        }
        if (self.imageView) {
            [vibrancyView.contentView addSubview:self.imageView];
        }
    }
    return _vibrancyView;
}

- (void)applyStyle:(SOBlurButtonStyle *)style {
    [super applyStyle:style];
    self.blurStyle = style.blurStyle;
    self.vibrant = style.vibrant;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
