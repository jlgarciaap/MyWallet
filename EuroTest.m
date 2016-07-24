//
//  WalletTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 21/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Euro.h"

//Importamos Money al haberle creado metodos de clase para quitar la redundancia de
//los inits en las clases euro y dollar. Y asi podriamos usar el metodo
//correspondiente.
#import "Money.h"

@interface EuroTest : XCTestCase

@end

@implementation EuroTest

-(void)testMultiplication{
    
    //Antes de crear los metodos de clase de Money teniamos esto
    //Euro *euro = [[Euro alloc]initWithAmount: 5];
    Euro *euro = [Money euroWithAmount:5];
    Euro *ten = [Money euroWithAmount:10];
    Euro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten);
}

-(void)testEquality{
    
    Euro *five = [Money euroWithAmount:5];
    Euro *ten = [Money euroWithAmount:10];
    
    Euro *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten);
    
    
}

-(void) testHash{
    
    Euro *twoA = [Money euroWithAmount:2];
    Euro *twoB = [Money euroWithAmount:2];
    
    XCTAssertEqual([twoA hash], [twoB hash]);
    
}

-(void) testAmountStorage{
    
    Euro *euro = [Money euroWithAmount:2];
    
    //Con el perform selector recibimos mensajes declaradas de metodos
    //El problema de este selector es que devuelve ID por lo que no podemos
    //dejar la propiedad amount como  NSInteger, lo cambiamos de momento a NSNUmber
#pragma clang diagnostic push//Indicamos que mandamos datos al clang(compilador)
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //Esto estaria dando un warning de selctor constantemente como es solo para test
    //y queremos ignoarlo se lo indicamos
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue]);
    
#pragma clang diagnostic pop//indicamos que dejamos de mandar al clang
    
}





@end
