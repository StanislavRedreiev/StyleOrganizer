
//
//  SOStylishImageView.h
//  Style Organizer
//
//  Created by super team on 05.05.16.
//
//

#import <UIKit/UIKit.h>

@interface SOStylishImageView : UIImageView

- (instancetype)initWithFrame:(CGRect)frame
                        style:(NSString *)style;

- (instancetype)initWithImage:(UIImage *)image
                        style:(NSString *)style;

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                        style:(NSString *)style;

@property(nonatomic, strong) IBInspectable NSString *style;

@end
