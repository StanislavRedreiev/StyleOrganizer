//
//  UIView+ApplyBaseStyle.h
//  Style Organizer
//
//  Created by super team on 12.05.16.
//
//

#import <UIKit/UIKit.h>
#import "SOBaseStyle.h"

@interface UIView (ApplyBaseStyle)

//Constrants with High Proirity (750) , will be simply overwritten by storyboards or other constraints.

@property (nonatomic,strong) NSLayoutConstraint* highPriorityWidthConstraint;
@property (nonatomic,strong) NSLayoutConstraint* highPriorityHeightConstraint;

@property (nonatomic) BOOL usingHalfSizeCornerRadius;

- (void)applyBaseStyle:(SOBaseStyle*)baseStyle;
+ (NSDictionary*)textAttributesWithTextAttributes:(NSDictionary*)textAttributes textColor:(UIColor*)textColor;
- (void)onLayoutSubviews;

@end
