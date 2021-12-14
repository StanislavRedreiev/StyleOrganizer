//
//  SOStylishSegmentedControl.h
//  Style Organizer
//
//  Created by super team on 07.10.16.
//
//

#import <UIKit/UIKit.h>


@interface SOStylishSegmentedControl : UISegmentedControl
- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;

@property(nonatomic, strong) IBInspectable NSString *style;

@end
