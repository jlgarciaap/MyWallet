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
//para refactorizar un poco sacamos todo lo que inicializamos en varios o todos los test
//lo primero creamos un propiedad
@property (nonatomic, strong) Broker *emptyBroker;
@property (nonatomic,strong) Money *oneDollar;

@end

@implementation BrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //En este punto se inicializan para todos los test lo que pongamos

    self.emptyBroker = [Broker new]; //Creamos una nueva instancia de broker para cada test
    self.oneDollar = [Money dollarWithAmount:1];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    //En este punto eliminamos al final de cada test
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction{
    
    
    Money *sum = [[Money dollarWithAmount: 5] plus:[Money dollarWithAmount:5]];
    
    
    Money *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be  NOP");
    
    
}


// $10 == €5 con tasa de 2:1. Esto por no gestionar numeros en float
-(void) testReduction{
    
    
    
    [self.emptyBroker addRate: 2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    
    Money *dollars = [Money dollarWithAmount:10];
    Money *euros = [Money euroWithAmount:5];
    
    Money *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros,@"$10 == €5 con tasa de 2:1");
//    
//    [self.emptyBroker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
//    Money *converted2 = [self.emptyBroker reduce:euros toCurrency:@"USD"];
//    
//    XCTAssertEqualObjects(converted2, dollars,@"$10 == €5 con tasa de 2:1");
//    
    
}

-(void) testThatNoRateRaisesException{
    
    //Controlamos si no damos tasa de conversion nos da excepcion
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    //Comprobamos que si el dollar lo convertimos a Dollar es el mismo
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect");
    
}




















@end
