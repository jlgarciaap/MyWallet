//
//  WalletTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 27/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>


#import "Broker.h"
#import "Wallet.h"
#import "Money.h"

@interface WalletTest : XCTestCase

@end

@implementation WalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//€40 + $20 = $100
-(void) testReductionAdition{

    //Tiene que tener varios moneys y tiene que entender los mensajes de money
    
    Broker *broker = [Broker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    
    
    Wallet *wallet = [[Wallet alloc]initWithAmount: 40 currency:@"EUR"];
    [wallet plus: [Money dollarWithAmount: 20]];
    
    Money *reduce = [broker reduce: wallet toCurrency:@"USD"];
                      
    XCTAssertEqualObjects(reduce, [Money dollarWithAmount:100],@"€40 + $20 = $100 ratio 2:1");
    

    
}

























@end
