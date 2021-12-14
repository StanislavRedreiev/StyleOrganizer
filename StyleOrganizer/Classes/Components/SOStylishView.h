//
//  SOStylishView.h
//  Style Organizer
//
//  Created by super team on 12.05.16.
//
//

#import <UIKit/UIKit.h>
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"
#import "SOViewStyle.h"

@interface SOStylishView : UIView <SOStylishComponent>

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NSString *)styleName;
@property(nonatomic, strong) IBInspectable NSString *style;

@end
