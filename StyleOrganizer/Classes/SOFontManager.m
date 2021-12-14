//
//  SOFontManager.m
//  Style Organizer
//
//  Created by super team on 4/2/19.
//

#import "SOFontManager.h"


@interface SOFontManager ()

@property (nonatomic, class, readonly) NSDictionary<NSNumber*, UIFont*>* fonts;

@end

@implementation SOFontManager

static NSDictionary<NSNumber*, UIFont*>* _fonts;

+ (NSDictionary<NSNumber*, UIFont*>*)fonts {
    return _fonts;
}

+ (void)setFontsNamesForWeights:(NSDictionary<NSNumber*, NSString*>*)fontsNames {
    NSMutableDictionary<NSNumber*, UIFont*>* fonts = NSMutableDictionary.new;
    [fontsNames enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull weight, NSString * _Nonnull name, BOOL * _Nonnull stop) {
        fonts[weight] = [UIFont fontWithName:name size:16];
    }];
    [self setFontsForWeights:fonts];
}

+ (void)setFontsForWeights:(NSDictionary<NSNumber*/*FontWeight*/, UIFont*>*)fonts {
    _fonts = fonts;
}

+ (UIFont*)fontForWeight:(FontWeight)weight withSize:(CGFloat)size {
    UIFont *font = _fonts[@(weight)] ? : self.systemFonts[@(weight)];
    return  [font fontWithSize:size];
}

@end

@implementation SOFontManager (SystemFonts)

static NSDictionary* _systemFonts;


+ (NSDictionary<NSNumber*, UIFont*>*)systemFonts {
    if (!_systemFonts) {
        NSDictionary <NSNumber*,NSNumber*> * weights = @{
            @(FontWeightUltraLight): @(UIFontWeightUltraLight),
            @(FontWeightThin): @(UIFontWeightThin),
            @(FontWeightLight): @(UIFontWeightLight),
            @(FontWeightRegular): @(UIFontWeightRegular),
            @(FontWeightMedium): @(UIFontWeightMedium),
            @(FontWeightSemibold): @(UIFontWeightSemibold),
            @(FontWeightBold): @(UIFontWeightBold),
            @(FontWeightHeavy): @(UIFontWeightHeavy),
            @(FontWeightBlack): @(UIFontWeightBlack)
        };
        __auto_type fonts = [NSMutableDictionary<NSNumber* , UIFont*> new];
        [weights enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
            fonts[key] = [UIFont systemFontOfSize:16 weight:obj.floatValue];
        }];
        _systemFonts = fonts;
    }
    return _systemFonts;
}

@end
