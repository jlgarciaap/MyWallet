//
//  Euro.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 21/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Euro : Money

//Antes teniamos esta propiedad, para poder usarla y hacer pruebas ahora la ocultamos para que solo
//sea interna despues de corregir los cambios en los test y comprobamos que todo funciona
//@property (nonatomic, readonly) NSInteger amount;


//-(Euro*) times:(NSInteger) multiplier;

@end
