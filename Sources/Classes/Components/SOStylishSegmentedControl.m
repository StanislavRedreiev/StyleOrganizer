//
//  SOStylishSegmentedControl.m
//  Style Organizer
//
//  Created by super team on 07.10.16.
//
//

#import "SOStylishSegmentedControl.h"
#import "SOStylishComponent.h"
#import "UIView+SOStyleReloader.h"
#import "SOSegmentedControlStyle.h"

@interface SOStylishSegmentedControl () <SOStylishComponent>

@end

@implementation SOStylishSegmentedControl


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


- (void)applyStyle:(SOSegmentedControlStyle *)style {
    [self applyBaseStyle:style];
    if (style.textAttributes) {
        [self setTitleTextAttributes:style.textAttributes forState:UIControlStateNormal];
    }
    if (style.selectedTextAttributes) {
        [self setTitleTextAttributes:style.selectedTextAttributes forState:UIControlStateSelected];
    }
    if (style.disabledTextAttributes) {
        [self setTitleTextAttributes:style.disabledTextAttributes forState:UIControlStateDisabled];
    }

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
