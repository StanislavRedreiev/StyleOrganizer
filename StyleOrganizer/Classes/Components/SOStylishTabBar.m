//
//  SOStylishTabBar.m
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import "SOStylishTabBar.h"
#import "SOTabBarStyle.h"
#import "UIView+SOStyleReloader.h"
#import "UIView+ApplyBaseStyle.h"
#import "UIImage+ImageWithColor.h"
#import "SOStylishComponent.h"

@interface SOStylishTabBar () <SOStylishComponent>

@property (nonatomic,strong) NSDictionary <NSString*,id> *selectedAttributes;
@property (nonatomic,strong) NSDictionary <NSString*,id> *unselectedAttributes;
@property (nonatomic) BOOL hideIcons;

@end

@implementation SOStylishTabBar

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

- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
    if (self.hideIcons) {
        for(UITabBarItem * tabBarItem in items){
            tabBarItem.title = @"";
            tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        }
    }
    [self reloadItemsStyle:items];
    [super setItems:items animated:animated];
}


- (void)applyStyle:(SOTabBarStyle *)style {
    [self applyBaseStyle:style];
    if (style.backgroundImage) {
        [self setBackgroundImage:style.backgroundImage];
    }
    else if (style.backgroundColor) {
        [self setBackgroundImage:[UIImage imageWithColor:style.backgroundColor]];
    }
    self.shadowImage = style.shadowImage;
    if (style.unselectedImageColor) {
        if (@available(iOS 10.0, *)) {
            self.unselectedItemTintColor = style.unselectedTextColor;
        }
    }
    if (style.selectedImageColor) {
        self.tintColor = style.selectedImageColor;
    }
    if (style.optionsSetted & OptionsSettedTranslucent) {
        self.translucent = style.translucent;
    }
    if (style.barTintColor) {
        self.barTintColor = style.barTintColor;
    }
    self.barStyle = style.barStyle;
    self.hideIcons = style.hideIcons;
    NSMutableDictionary <NSString*,id> *baseAttributes = [NSMutableDictionary new];
    baseAttributes[NSFontAttributeName] = style.font;
    NSMutableDictionary <NSString*,id> *selectedAttributes = baseAttributes.mutableCopy;
    NSMutableDictionary <NSString*,id> *unselectedAttributes = baseAttributes.mutableCopy;
    selectedAttributes[NSForegroundColorAttributeName] = style.selectedTextColor;
    unselectedAttributes[NSForegroundColorAttributeName] = style.unselectedTextColor;
    self.selectedAttributes = selectedAttributes.count ? selectedAttributes.copy : nil;
    self.unselectedAttributes = unselectedAttributes.count ? unselectedAttributes.copy : nil;

    if (selectedAttributes.count) {

        [UITabBarItem.appearance setTitleTextAttributes:selectedAttributes
                                               forState:UIControlStateSelected];
    }
    if (unselectedAttributes.count) {
        
        [UITabBarItem.appearance setTitleTextAttributes:unselectedAttributes
                                               forState:UIControlStateNormal];
    }
    [self reloadItemsStyle:self.items];

}

- (void)reloadItemsStyle:(NSArray<UITabBarItem *> *)items {
    [items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (self.selectedAttributes) {
            [obj setTitleTextAttributes:self.selectedAttributes forState:UIControlStateSelected];
        }
        if (self.unselectedAttributes) {
            [obj setTitleTextAttributes:self.unselectedAttributes forState:UIControlStateNormal];

        }
    }];
}


@end
