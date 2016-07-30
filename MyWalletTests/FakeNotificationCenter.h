//
//  FakeNotificationCenter.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 28/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeNotificationCenter : NSObject

@property (nonatomic,strong) NSMutableDictionary *observers;

-(void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;


@end
