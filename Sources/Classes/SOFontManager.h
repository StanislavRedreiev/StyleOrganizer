//
//  SOFontManager.h
//  Style Organizer
//
//  Created by super team on 4/2/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FontWeight) {
    FontWeightUltraLight,
    FontWeightThin,
    FontWeightLight,
    FontWeightRegular,
    FontWeightMedium,
    FontWeightSemibold,
    FontWeightBold,
    FontWeightHeavy,
    FontWeightBlack
};

//static NSInteger RMFontWeightCount = FontWeightBlack+1;

@interface SOFontManager: NSObject

+ (void)setFontsNamesForWeights:(NSDictionary<NSNumber*, NSString*>*)fontsNames;
+ (void)setFontsForWeights:(NSDictionary<NSNumber*/*FontWeight*/, UIFont*>*)fonts;
+ (UIFont*)fontForWeight:(FontWeight)weight withSize:(CGFloat)size;

@end

@interface SOFontManager (SystemFonts)

@property (nonatomic, readonly, class) NSDictionary<NSNumber*, UIFont*>* systemFonts;

@end

NS_ASSUME_NONNULL_END
