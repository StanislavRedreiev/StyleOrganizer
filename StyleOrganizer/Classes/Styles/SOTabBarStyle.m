//
//  SOTabBarStyle.m
//  Style Organizer
//
//  Created by super team on 29.12.17.
//  Copyright © 2017 super team. All rights reserved.
//

#import "SOTabBarStyle.h"

@implementation SOTabBarStyle

- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    self->_optionsSetted|=OptionsSettedTranslucent;
}

@end
