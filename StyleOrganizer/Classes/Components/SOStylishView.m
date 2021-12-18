//
//  SOStylishView.m
//  Style Organizer
//
//  Created by super team on 12.05.16.
//
//

#import "SOStylishView.h"
#import "SOViewStyle.h"

@implementation SOStylishView

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

- (void)applyStyle:(SOViewStyle *)style {
   [self applyBaseStyle:style];
  if (style.backgroundColor) {
    self.backgroundColor = style.backgroundColor;
  }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

@end
