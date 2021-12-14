//
//  SOReloadStyleSubscriber.h
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOStyleReloadProtocol.h"
#import <Foundation/Foundation.h>

@interface SOReloadStyleSubscriber : NSObject

+ (void)subscribeForStyleReload:(id<SOStyleReloadProtocol>)subscriber
                          style:(NSString *)style;
+ (void)unsubscribeForStyleReload:(id<SOStyleReloadProtocol>)subscriber
                            style:(NSString *)style;

@end
