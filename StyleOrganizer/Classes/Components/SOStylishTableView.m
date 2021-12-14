//
//  SOStylishTableView.m
//  Style Organizer
//
//  Created by pm on 07.09.16.
//
//

#import "SOStylishTableView.h"
#import "SOStylishView.h"
#import "SOViewStyle.h"
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"

@interface SOStylishTableView () <SOStylishComponent>
@end

@implementation SOStylishTableView

- (instancetype)initWithFrame:(CGRect)frame styleName:(NSString *)styleName {
   self = [self initWithFrame:frame];
   if (self) {
      self.styleName = styleName;
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

- (void)setStyleName:(NSString *)styleName {
   _styleName = styleName;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
