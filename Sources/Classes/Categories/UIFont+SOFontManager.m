//
//  UIFont+SOFontManager.m
//  Style Organizer
//
//  Created by super team on 4/3/19.
//

#import "UIFont+RMFontManager.h"

@implementation UIFont (SOFontManager)

+ (instancetype)defaultFontWithWeight:(FontWeight)weight
                                 size:(CGFloat)size {
    return [SOFontManager fontForWeight:weight
                               withSize:size];
}

@end
