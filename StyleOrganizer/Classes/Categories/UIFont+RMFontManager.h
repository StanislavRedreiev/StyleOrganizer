//
//  UIFont+SOFontManager.h
//  StyleOrganizer
//
//  Created by super team on 4/3/19.
//

#import <UIKit/UIKit.h>
#import "SOFontManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (SOFontManager)

+ (instancetype)defaultFontWithWeight:(FontWeight)weight
                                 size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
