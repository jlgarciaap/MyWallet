//
//  MoneyTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

//Este era un test de comprobacion de excepciones con money ahora como hemos
//refactorizado times todo desde money y creado de forma generica con id
//esto no nos sirve

//-(void) testThatTimesRaisesException{
//    
//    Money *money = [[Money alloc]initWithAmount: 1];
//    XCTAssertThrows([money times:2], @"Should Raise Exception");
//    
//    
//}
//

-(void) testCurrency{
    
    
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency]);
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency]);
    
    
    
    
}


@end
