//
//  SOImageViewStyle.m
//  Style Organizer
//
//  Created by super team on 05.05.16.
//
//

#import "SOImageViewStyle.h"

@interface SOImageViewStyle ()


@end

@implementation SOImageViewStyle

- (instancetype)copyWithZone:(NSZone *)zone {
    SOImageViewStyle *newStyle = [super copyWithZone:zone];
    newStyle.renderingMode = self.renderingMode;
    newStyle.imageName = self.imageName;
    newStyle.image = self.image;
    newStyle.highlithedImage = self.highlithedImage;
    newStyle.bezierImage = self.bezierImage;
    newStyle->_optionsSetted = self.optionsSetted;
    return newStyle;
}

@end
