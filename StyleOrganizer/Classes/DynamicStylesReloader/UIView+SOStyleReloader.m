//
//  UIView+SOStyleReloader.m
//  Style Organizer
//
//  Created by super team on 16.04.16.
//  Copyright © 2016 super team. All rights reserved.
//

#import "StyleOrganizer.h"
#import "UIView+SOStyleReloader.h"
#import "SOStylishComponent.h"

@implementation UIView (SOStyleReloader)

- (NSString*)styleNameForComponent:(id<SOStylishComponent>)component {
   if ([component respondsToSelector:@selector(styleName)]) {
      return  [component styleName];
   }
   if ([component respondsToSelector:@selector(style)]) {
      return  [component style];
   }

   return nil;
}

- (void)subscribeSelfForStyle {
   if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
      [SOReloadStyleSubscriber
       subscribeForStyleReload:(id<SOStyleReloadProtocol>)self
       style:[self styleNameForComponent:(id<SOStylishComponent>)self]];
   }
}

- (void)unsubscribeSelfForStyle {
   if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
      [SOReloadStyleSubscriber
       unsubscribeForStyleReload:(id<SOStyleReloadProtocol>)self
       style:[self styleNameForComponent:(id<SOStylishComponent>)self]];
   }
}

- (void)reloadStyle {
   if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
      NSString *styleName = [self styleNameForComponent:(id<SOStylishComponent>)self];
      if (styleName) {
         [(id<SOStylishComponent>)self applyStyle:[[StyleOrganizer sharedStyleManager]
                            styleForKey:styleName]];
      }
   }
}

#pragma mark - Styles Subscriptions

- (void)styleDidChanged:(NSNotification *)notification {
   if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
      if ([[self styleNameForComponent:(id<SOStylishComponent>)self] isEqualToString:notification.object]) {
         [self reloadStyle];
      }
   }
}

@end

@implementation UIBarItem (SOStyleReloader)

- (NSString*)styleNameForComponent:(id<SOStylishComponent>)component {
    if ([component respondsToSelector:@selector(styleName)]) {
        return  [component styleName];
    }
    if ([component respondsToSelector:@selector(style)]) {
        return  [component style];
    }
    
    return nil;
}

- (void)subscribeSelfForStyle {
    if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
        [SOReloadStyleSubscriber
         subscribeForStyleReload:(id<SOStyleReloadProtocol>)self
         style:[self styleNameForComponent:(id<SOStylishComponent>)self]];
    }
}

- (void)unsubscribeSelfForStyle {
    if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
        [SOReloadStyleSubscriber
         unsubscribeForStyleReload:(id<SOStyleReloadProtocol>)self
         style:[self styleNameForComponent:(id<SOStylishComponent>)self]];
    }
}

- (void)reloadStyle {
    if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
        NSString *styleName = [self styleNameForComponent:(id<SOStylishComponent>)self];
        if (styleName) {
            [(id<SOStylishComponent>)self applyStyle:[[StyleOrganizer sharedStyleManager]
                                                      styleForKey:styleName]];
        }
    }
}

#pragma mark - Styles Subscriptions

- (void)styleDidChanged:(NSNotification *)notification {
    if ([self conformsToProtocol:@protocol(SOStylishComponent)]) {
        if ([[self styleNameForComponent:(id<SOStylishComponent>)self] isEqualToString:notification.object]) {
            [self reloadStyle];
        }
    }
}

@end
