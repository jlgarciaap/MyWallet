//
//  Broker.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 26/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;


@interface Broker : NSObject

-(Money *)reduce:(Money *) money toCurrency: (NSString *) currency;

@end
