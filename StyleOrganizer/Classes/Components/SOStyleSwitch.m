//
//  SOStyleSwitch.m
//  Style Organizer
//
//  Created by super team on 03.02.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "StyleOrganizer.h"
#import "SOStyleSwitch.h"
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"

@interface SOStyleSwitch () <SOStylishComponent>

@end

@implementation SOStyleSwitch

@synthesize style = _style;

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

- (void)applyStyle:(SOSwitchStyle *)style {
  [self applyBaseStyle:style];
  if (style.backgroundColor) {
    self.backgroundColor = style.backgroundColor;
  }
  if (style.thumbTint) {
    self.thumbTintColor = style.thumbTint;
  }
  if (style.onTintColor) {
    self.onTintColor = style.onTintColor;
  }
  if (style.backgroundColor) {
    self.backgroundColor = style.backgroundColor;
  }
  if (style.cornerHalfSize) {
    self.layer.cornerRadius = self.frame.size.height / 2.f;
  }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

@end

