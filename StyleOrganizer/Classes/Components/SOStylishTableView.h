//
//  SOStylishTableView.h
//  Style Organizer
//
//  Created by pm on 07.09.16.
//
//

#import <UIKit/UIKit.h>

@interface SOStylishTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame styleName:(NSString *)styleName;
@property(nonatomic, strong) IBInspectable NSString *styleName;

@end
