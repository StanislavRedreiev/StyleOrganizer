//
//  UIbezierImage.m
//  Style Organizer
//
//  Created by super team on 3/13/19.
//

#import "UIBezierImage.h"

@implementation UIBezierImage

- (instancetype)initWithPath:(UIBezierPath*)path
                  originSize:(CGSize)originSize
                        fill:(BOOL)fill{
    self = [super init];
    if (self) {
        self.path = path;
        self.originSize = originSize;
        self.fill = fill;
    }
    return self;
}

- (UIImage *)originImage {
    return [self imageWithSize:_originSize];
}

- (UIImage*)imageWithSize:(CGSize)size {
    CGFloat scaleX = size.width/_originSize.width;
    CGFloat scaleY = size.height/_originSize.height;
    UIBezierPath* path = self.path.copy;
    [path applyTransform:CGAffineTransformMakeScale(scaleX, scaleY)];
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    [UIColor.blackColor setStroke];
    [UIColor.blackColor setFill];
    [path stroke];
    if (self.fill) {
        [path fill];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
