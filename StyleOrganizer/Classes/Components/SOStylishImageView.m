//
//  SOStylishImageView.m
//  Style Organizer
//
//  Created by super team on 05.05.16.
//
//

#import "SOImageViewStyle.h"
#import "SOStylishComponent.h"
#import "SOStylishImageView.h"
#import "UIView+SOStyleReloader.h"


@interface SOStylishImageView () <SOStylishComponent>

@property(nonatomic) UIImageRenderingMode renderingMode;
@property(nonatomic, strong) UIColor* highlithedTintColor;
@property(nonatomic, strong) UIColor* originTintColor;
@property(nonatomic, strong) UIBezierImage* bezierImage;

@end

@implementation SOStylishImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(NSString *)style {
    self = [self initWithFrame:frame];
    if (self) {
        self.style = style;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image style:(NSString *)style {
    self = [self initWithImage:image];
    if (self) {
        self.style = style;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                        style:(NSString *)style {
    self =
    [self initWithImage:image highlightedImage:highlightedImage style:style];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *image = self.image;
    self.image = nil;
    self.image = image;
}

- (void)setImage:(UIImage *)image {
    if (image) {
        [super setImage:[image imageWithRenderingMode:self.renderingMode]];
    } else {
        [super setImage:image];
    }
}

- (void)applyStyle:(SOImageViewStyle *)style {
    self.renderingMode = style.renderingMode;
    [self applyBaseStyle:style];
    if (style.image) {
        self.image = style.image;
    } else if (style.imageName) {
#if !TARGET_INTERFACE_BUILDER
        self.image = [UIImage imageNamed:style.imageName];
#else
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        UIImage *image = [UIImage imageNamed:style.imageName
                                    inBundle:bundle
               compatibleWithTraitCollection:self.traitCollection];
        self.image = image;
#endif
    } else {
#if TARGET_INTERFACE_BUILDER
        self.image = self.image;
#endif
    }
    
    if (style.highlithedImage) {
        self.highlightedImage = style.highlithedImage;
    }

    self.originTintColor = style.tintColor;
    self.highlithedTintColor = style.highlithedTintColor;
    self.bezierImage = style.bezierImage;
    if (style.backgroundColor) {
        self.backgroundColor = style.backgroundColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.tintColor = self.highlithedTintColor;
    } else if (self.originTintColor) {
        self.tintColor = self.originTintColor;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self onLayoutSubviews];
    if (self.bezierImage) {
        self.image = [[self.bezierImage imageWithSize:self.bounds.size] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
}


@end
