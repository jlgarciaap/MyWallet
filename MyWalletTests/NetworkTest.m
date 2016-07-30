//
//  NetworkTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 29/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Broker.h"

@interface NetworkTest : XCTestCase

@end

@implementation NetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



-(void) testThatEmptyRatesRaisesException{
    
    Broker *broker = [Broker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData],@"An empty json should raise exception");
    
}













@end
