//
//  Wallet.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 27/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSUInteger currenciesCount;

@property (nonatomic,strong) NSMutableDictionary *dictMoneys;

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

-(NSUInteger) countInSection:(NSInteger)section;

//Para la celda
-(Money *) moneySelected:(NSIndexPath *) indexPath;

-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency broker:(Broker *)broker;

@end
