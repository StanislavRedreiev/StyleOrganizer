//
//  SOSegmentedControlStyle.h
//  Style Organizer
//
//  Created by super team on 07.10.16.
//
//

#import "SOViewStyle.h"

@interface SOSegmentedControlStyle : SOViewStyle

@property (nonatomic,strong) NSDictionary *textAttributes;
@property (nonatomic,strong) NSDictionary *selectedTextAttributes;
@property (nonatomic,strong) NSDictionary *disabledTextAttributes;

@end
