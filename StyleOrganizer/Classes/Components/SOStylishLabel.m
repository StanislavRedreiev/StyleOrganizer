//
//  RMStylishLabel.m
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "SOLabelStyle.h"
#import "StyleOrganizer.h"
#import "SOStylishLabel.h"
#import "UILabel+TextKerning.h"
#import "UIView+SOStyleReloader.h"
#import <objc/runtime.h>
#import "SOStylishComponent.h"

@interface SOStylishLabel () <SOStylishComponent>

@property(nonatomic, strong) NSDictionary<NSString *, id> *textAttributes;
@property(nonatomic) BOOL loadColorFromTextColor;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic, strong) UIFont *regularFont;
@property(nonatomic, strong) UIFont *highlightedFont;

@end

@implementation SOStylishLabel

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

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.height+=self.insets.top+self.insets.bottom;
    size.width+=self.insets.left+self.insets.right;
    return size;
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

- (void)applyStyle:(SOLabelStyle *)style {
    if (!style.borderColor) {
        self.loadColorFromTextColor = YES;
    }
    if (style.textColor) {
        self.textColor = style.textColor;
    }
    self.insets = style.insets;
    [self applyBaseStyle:style];
    if (style.backgroundColor) {
        self.backgroundColor = style.backgroundColor;
    }
    if (style.font) {
        self.font = style.font;
        self.regularFont = self.font;
    }
    if (style.shadowColor) {
        self.shadowColor = style.shadowColor;
    }
    if (style.kerning) {
        [self setKerning:style.kerning];
    }
    if (style.fontColor) {
        self.textColor = style.fontColor;
    }
    if (style.highlightedTextColor) {
        self.highlightedTextColor = style.highlightedTextColor;
    }
    
    if (style.fontSize) {
        self.font = [self.font fontWithSize:style.fontSize];
        self.regularFont = self.font;
    }
    
    if (style.textAlignment) {
        self.textAlignment = style.textAlignment;
    }
    if (style.numberOfLines) {
        self.numberOfLines = style.numberOfLines;
    }

    if (style.textAttributes) {
        self.textAttributes = [self.class textAttributesWithTextAttributes:style.textAttributes textColor:style.textColor];
        [self setText:self.text];
    }
    if (style.minimumFontScale) {
        self.minimumScaleFactor = style.minimumFontScale;
    }
    if (style.highlightedFont) {
        self.highlightedFont = style.highlightedFont;
    }
}



- (void)setTextColor:(UIColor *)textColor {
   [super setTextColor:textColor];
   if (self.loadColorFromTextColor) {
      self.layer.borderColor = textColor.CGColor;
   }
}

- (void)setText:(NSString *)text {
   if (self.textAttributes && text && text.length) {
       NSMutableDictionary *textAttributes = [self.textAttributes mutableCopy];
       if (textAttributes[NSParagraphStyleAttributeName]) {
           NSMutableParagraphStyle* paragraphStyle = [textAttributes[NSParagraphStyleAttributeName] mutableCopy];
           paragraphStyle.alignment = self.textAlignment;
           paragraphStyle.lineBreakMode = self.lineBreakMode;
           textAttributes[NSParagraphStyleAttributeName] = paragraphStyle;

       }
      NSAttributedString *attributedString =
      [[NSAttributedString alloc] initWithString:text
                                      attributes:textAttributes];
      [self setAttributedText:attributedString];
   } else {
      [super setText:text];
   }
}

-(NSString *)description {
   return  [[super description] stringByAppendingFormat:@"\nstyle=%@",self.style];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (self.highlightedFont != nil) {
        self.font = highlighted ? self.highlightedFont : self.regularFont;
    }
}

@end
