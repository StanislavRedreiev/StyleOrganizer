//
//  SOImageViewStyle.h
//  Style Organizer
//
//  Created by super team on 05.05.16.
//
//

#import "SOBaseStyle.h"
#import "UIBezierImage.h"

@interface SOImageViewStyle : SOBaseStyle

@property(nonatomic) UIImageRenderingMode renderingMode;
@property(nonatomic, strong, nullable) NSString *imageName;
@property(nonatomic, strong, nullable) UIImage *highlithedImage;
@property(nonatomic, strong, nullable) UIColor *highlithedTintColor;
@property(nonatomic, strong, nullable) UIImage *image;
@property(nonatomic, strong, nullable) UIBezierImage *bezierImage;

@end
