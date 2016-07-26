//
//  BrokerTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 26/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"

@interface BrokerTest : XCTestCase

@end

@implementation BrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimpleReduction{
    
    Broker *broker = [[Broker alloc]init];
    Money *sum = [[Money dollarWithAmount: 5] plus:[Money dollarWithAmount:5]];
    
    
    Money *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be  NOP");
    
    
}



@end
