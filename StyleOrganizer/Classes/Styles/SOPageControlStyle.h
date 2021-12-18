//
//  SOPageControlStyle.h
//  Style Organizer
//
//  Created by super team on 08.07.16.
//
//

#import "SOViewStyle.h"

@interface SOPageControlStyle : SOViewStyle

@property(nonatomic, strong) UIColor *pageIndicatorTintColor;
@property(nonatomic, strong) UIColor *currentPageIndicatorTintColor;
@property(nonatomic) BOOL hidesForSinglePage;

@end
