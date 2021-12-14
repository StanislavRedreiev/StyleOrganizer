//
//  SOStylishPageControl.h
//  Style Organizer
//
//  Created by super team on 08.07.16.
//
//

#import <UIKit/UIKit.h>

@interface SOStylishPageControl : UIPageControl

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;

@property(nonatomic, strong) IBInspectable NSString *style;

@end
