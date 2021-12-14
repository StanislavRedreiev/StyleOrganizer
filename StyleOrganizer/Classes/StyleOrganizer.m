//
//  StyleOrganizer.m
//  Style Organizer
//
//  Created by super team on 24.04.15.
//  Copyright (c) 2015 super team. All rights reserved.
//

#import "StyleOrganizer.h"
#import <objc/runtime.h>

#import "SOStyleReloadProtocol.h"

@interface StyleOrganizer ()

@property(nonatomic, strong) NSMutableDictionary *stylesDict;

@end

@implementation StyleOrganizer

+ (instancetype)sharedStyleManager {
   static StyleOrganizer *_sharedStyleManager = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      _sharedStyleManager = [StyleOrganizer new];
   });
   return _sharedStyleManager;
}

+ (SOBaseStyle *)styleForKey:(NSString *)key {
   return [[self sharedStyleManager] styleForKey:key];
}

- (void)reloadStyleForKey:(NSString*)key {
   _stylesDict[key] = nil;
   [[NSNotificationCenter defaultCenter]
    postNotificationName:reloadStyleNotification
    object:key
    userInfo:nil];
}

- (void)reloadAllStyles {
   _stylesDict = nil;
   [[NSNotificationCenter defaultCenter]
    postNotificationName:reloadAllStylesNotification
    object:nil
    userInfo:nil];
}

- (void)setStyle:(SOBaseStyle *)style forKey:(NSString *)key {
   BOOL hadStyle =self.stylesDict[key] ? YES : NO;
   self.stylesDict[key] = style;
   if (hadStyle) {
      [self reloadStyleForKey:key];
   }
}

- (SOBaseStyle *)styleForKey:(NSString *)key {
   if (!self.stylesDict[key]) {
      SEL selector = NSSelectorFromString(key);
      if ([[self class] respondsToSelector:selector]) {
         IMP imp = [[self class] methodForSelector:selector];
         id (*func)(id, SEL, NSString *) = (void *)imp;
         SOBaseStyle *style = func([self class], selector, key);
         [self setStyle:style forKey:key];
      }
   }
   return self.stylesDict[key];
}

- (NSMutableDictionary *)stylesDict {
   if (!_stylesDict) {
      _stylesDict = [NSMutableDictionary new];
   }
   return _stylesDict;
}

@end
