//
//  NSObject+GNUStepAddons.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
//importamos para poder usar el runtime de objective-c
#import <objc/runtime.h>

@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-' ;
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass", NSStringFromClass([self class]),prefix, NSStringFromSelector(aSel)];
    
    return self;
}


@end
