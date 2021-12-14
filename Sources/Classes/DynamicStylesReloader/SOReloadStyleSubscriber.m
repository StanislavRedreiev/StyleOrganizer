//
//  SOReloadStyleSubscriber.m
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "SOReloadStyleSubscriber.h"

@implementation SOReloadStyleSubscriber

+ (void)subscribeForStyleReload:(id<SOStyleReloadProtocol>)subscriber
                          style:(NSString *)style {
   [[NSNotificationCenter defaultCenter] addObserver:subscriber
                                            selector:@selector(reloadStyle)
                                                name:reloadAllStylesNotification
                                              object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:subscriber
                                            selector:@selector(styleDidChanged:)
                                                name:reloadStyleNotification
                                              object:style];
}

+ (void)unsubscribeForStyleReload:(id<SOStyleReloadProtocol>)subscriber
                            style:(NSString *)style {
   [[NSNotificationCenter defaultCenter]
    removeObserver:subscriber
    name:reloadAllStylesNotification
    object:nil];
   [[NSNotificationCenter defaultCenter] removeObserver:subscriber
                                                   name:reloadStyleNotification
                                                 object:style];
}

@end
