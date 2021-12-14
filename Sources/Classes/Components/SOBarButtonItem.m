//
//  SOBarButtonItem.m
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import "SOBarButtonItem.h"
#import "SOStylishComponent.h"
#import "UIView+SOStyleReloader.h"
#import "SOBarButtonItemStyle.h"

@interface SOBarButtonItem () <SOStylishComponent>
@end

@implementation SOBarButtonItem

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWittStyleName:(NSString*)styleName {
    self = [self init];
    if (self) {
        self.styleName = styleName;
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

- (void)applyBaseStyle:(__kindof SOBaseStyle *)style {
    
}

- (void)commonInit {
    [self subscribeSelfForStyle];
}

- (void)dealloc {
    [self unsubscribeSelfForStyle];
}

- (void)setStyleName:(NSString *)styleName {
    _styleName = styleName;
    [self reloadStyle];
}

- (void)applyStyle:(SOBarButtonItemStyle *)style {
    if (style.tintColor) {
        self.tintColor = style.tintColor;
    }
    if (style.image) {
        self.image = style.image;
    }
    if (style.font) {
        NSMutableDictionary <NSString*,id>*textAttributes = [NSMutableDictionary new];
        textAttributes[NSFontAttributeName] = style.font;
        textAttributes[NSForegroundColorAttributeName] = style.tintColor;
        [self setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        NSMutableDictionary <NSString*,id>*disabledTextAttributes = textAttributes.mutableCopy;
        disabledTextAttributes[NSForegroundColorAttributeName] = style.disabledTextColor ? style.disabledTextColor : [style.disabledTextColor colorWithAlphaComponent:0.8];
        [self setTitleTextAttributes:disabledTextAttributes forState:UIControlStateDisabled];
        [self setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];

    }
    if (style.title) {
        self.title = style.title;
    }
}

@end
