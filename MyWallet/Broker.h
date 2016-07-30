//
//  Broker.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 26/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"


@interface Broker : NSObject

@property (nonatomic,strong) NSMutableDictionary *rates;

-(Money *)reduce:(id<Money>) money toCurrency: (NSString *) currency;
-(void) addRate:(double) rate fromCurrency:(NSString*)fromCurrency toCurrency:(NSString*) toCurrency;
-(NSString *) keyFromCurrency:(NSString *)fromCurrency toCurrency: (NSString *)toCurrency;

-(void) parseJSONRates:(NSData *) json;

@end
