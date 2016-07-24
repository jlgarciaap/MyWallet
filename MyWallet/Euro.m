//
//  Euro.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 21/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "Euro.h"

//Antes teniamos esto pero una vez que creamos la propiedad en private para poder
//heredarla lo que hacemos es importar
#import "Money-Private.h"
//@interface Euro()
//
//@property (nonatomic) NSInteger amount; //Creamos tambien la propiedad dentro sin readonly
////la idea es que desde fuera no se pueda cambiar y desde dentro si
//
//@end

//Importamos Money al haberle creado metodos de clase para quitar la redundancia de
//los inits en las clases euro y dollar. Y asi podriamos usar el metodo
//correspondiente.
#import "Money.h"

@implementation Euro

//Teniamos todo esto al principio segun hemos ido avanzando lo hemos perdido jejejej
//Lo ultimo era el times que lo hemos añadido a money

//Cambiamos la devolucion para hacer que sea inmutable antes solo haciamos la multipliacion
// y modificabamos el primer Euro, ahora creamos otro lo modificamos y lo devolvemos
//-(Euro*) times:(NSInteger) multiplier{
//    
//    //Euro *newEuro = [[Euro alloc] initWithAmount:self.amount * multiplier ];
//    //Antes del selector era  asi
//    //Ahora como se supone que es un NSNumber tenemos que hacer una especia de cast
//    //para transformar el contenido en un NSinteger
//    
//    Euro *newEuro = [[Euro alloc] initWithAmount:[self.amount integerValue] * multiplier];
//    
//    return newEuro;
//    
//    
//}

#pragma mark - Overwritten







@end
