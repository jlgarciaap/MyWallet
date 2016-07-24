//
//  Dollar.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "Dollar.h"
#import "Money-Private.h"

//En Euro ya lo hemos visto antes era asi ahora importamos
//@interface Dollar()
//
//@property (nonatomic) NSInteger amount; //Creamos tambien la propiedad dentro sin readonly
////la idea es que desde fuera no se pueda cambiar y desde dentro si
//
//@end

@implementation Dollar



//Cambiamos la devolucion para hacer que sea inmutable antes solo haciamos la multipliacion
// y modificabamos el primer Euro, ahora creamos otro lo modificamos y lo devolvemos
//-(Dollar*) times:(NSInteger) multiplier{
//    
//    //Dollar *newEuro = [[Dollar alloc] initWithAmount:self.amount * multiplier];
//    //Antes del selector era  asi
//    //Ahora como se supone que es un NSNumber tenemos que hacer una especia de cast
//    //para transformar el contenido en un NSinteger
//    Dollar *newDollar = [[Dollar alloc] initWithAmount:[self.amount integerValue]* multiplier];
//
//    
//    return newDollar;
//    
//    
//}

#pragma mark - Overwritten





@end
