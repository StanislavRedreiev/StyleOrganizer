//
//  SOStylishProgressView.h
//  Style Organizer
//
//  Created by Max on 22.12.16.
//
//

#import <UIKit/UIKit.h>

@interface SOStylishProgressView : UIProgressView


- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;
@property(nonatomic, strong) IBInspectable NSString *style;

@end
