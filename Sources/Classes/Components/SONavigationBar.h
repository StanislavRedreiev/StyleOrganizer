//
//  RM.h
//  Style Organizer
//
//  Created by super team on 21.04.16.
//
//

#import <UIKit/UIKit.h>

@interface SONavigationBar : UINavigationBar

@property(nonatomic, strong) IBInspectable NSString *style;

- (void)setNavigationBackgroundHidden:(BOOL)hidden animated:(BOOL)animated;

@end
