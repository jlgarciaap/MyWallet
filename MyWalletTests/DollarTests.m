//
//  DollarTests.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"

#import "Money.h"

@interface DollarTests : XCTestCase

@end

@implementation DollarTests

-(void)testMultiplication {
    
    Dollar *five = [Money dollarWithAmount: 5];
    Dollar *ten = [Money dollarWithAmount:10];
    
    Dollar *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total);
}

-(void)testEquality{
    
    Dollar *five = [Money dollarWithAmount: 5];
    Dollar *ten = [Money dollarWithAmount: 10];
    
    Dollar *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total);
    //en el assertFalse estamos comprobando que realmente no son iguales
    //Esto fallaba antes de poner amount como privado y que se heredara
    XCTAssertFalse([total isEqual:five]);
    
}


-(void) testHash{
    
    Dollar *twoA = [Money dollarWithAmount: 2];
    Dollar *twoB = [Money dollarWithAmount: 2];
    
    XCTAssertEqual([twoA hash], [twoB hash],@"Equal objects must have the same hash");
    
}
-(void) testAmountStorage{
    
    Dollar *dollar = [Money dollarWithAmount:2];
    
    //Con el perform selector recibimos mensajes declaradas de metodos
    //El problema de este selector es que devuelve ID por lo que no podemos
    //dejar la propiedad amount como  NSInteger, lo cambiamos de momento a NSNUmber
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //Esto estaria dando un warning de selctor constantemente como es solo para test
    //y queremos ignoarlo se lo indicamos
    
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue]);
    
#pragma clang diagnostic pop
    
}



@end
