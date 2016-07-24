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

-(void)testMultiplication{
    
    //Antes de crear los metodos de clase de Money teniamos esto
    //Euro *euro = [[Euro alloc]initWithAmount: 5];
    //Antes del refactorizado de todo en money teniamos los tests con las clases asi
    //Y estaban en otro modelo de test de Euro. Teniamos tambien una clase Dollar
    //Ahora lo comprobamos todo desde aqui
    //    Euro *euro = [Money euroWithAmount:5];
    //    Euro *ten = [Money euroWithAmount:10];
    //    Euro *total = [euro times:2];
    
    Money *euro = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten);
    
    Money *dollar = [Money dollarWithAmount:5];
    Money *ten2 = [Money dollarWithAmount:10];
    Money *total2 = [dollar times:2];
    
    
    XCTAssertEqualObjects(total2, ten2);
}

-(void)testEquality{
    
    Money *five = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    
    Money *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten);
    
    Money *five2 = [Money dollarWithAmount:5];
    Money *ten2 = [Money dollarWithAmount:10];
    Money *total2 = [five2 times:2];
    
    XCTAssertEqualObjects(total2, ten2);
    
}

-(void) testHash{
    
    Money *twoA = [Money euroWithAmount:2];
    Money *twoB = [Money euroWithAmount:2];
    
    XCTAssertEqual([twoA hash], [twoB hash]);
    
    Money *twoADollar = [Money dollarWithAmount:2];
    Money *twoBDollar = [Money dollarWithAmount:2];
    
    XCTAssertEqual([twoADollar hash], [twoBDollar hash]);
    
}

-(void) testAmountStorage{
    
    Money *euro = [Money euroWithAmount:2];
    
    Money *dollar = [Money dollarWithAmount:2];
    
    //Con el perform selector recibimos mensajes declaradas de metodos
    //El problema de este selector es que devuelve ID por lo que no podemos
    //dejar la propiedad amount como  NSInteger, lo cambiamos de momento a NSNUmber
#pragma clang diagnostic push//Indicamos que mandamos datos al clang(compilador)
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //Esto estaria dando un warning de selctor constantemente como es solo para test
    //y queremos ignoarlo se lo indicamos
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue]);
    
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue]);
    
#pragma clang diagnostic pop//indicamos que dejamos de mandar al clang
    
}

-(void) testDifferenceCurrencies{
    
    Money *euro = [Money euroWithAmount:1];
    
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar ,@"Difference currencies are not equal!");
    
    
    
}



@end
