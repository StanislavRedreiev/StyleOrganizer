//
//  UIbezierImage.h
//  Style Organizer
//
//  Created by super team on 3/13/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierImage: NSObject

@property (nonatomic,strong) UIBezierPath *path;
@property (nonatomic) CGSize originSize;
@property (nonatomic) BOOL fill;
@property (nonatomic, readonly) UIImage* originImage;

- (instancetype)initWithPath:(UIBezierPath*)path
                  originSize:(CGSize)originSize
                        fill:(BOOL)fill;
- (UIImage*)imageWithSize:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
