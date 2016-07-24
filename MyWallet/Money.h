//
//  Money.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

//Usamos estos metodos de clase para evitar repetirnos en dollar y euro con su
//instanciacion

//Con (instancetype) indicamos que devolvemos una instancia de nuestra propia clase
//en este caso seria de Money. Esto seria lo normal pero en situaciones como esta
//ponemos ID para que el compilador devuelva el objeto que necesita

//+(instancetype) euroWithAmount: (NSInteger) amount;

@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount: (NSInteger) amount;

+(id) dollarWithAmount: (NSInteger) amount;

-(id)initWithAmount: (NSInteger) amount
           currency: (NSString *) currency;

//Antes devolviamos una instancia de money ahora como es generico para todas
//devolvemos id
//-(Money *) times: (NSInteger) multiplier;

-(id) times: (NSInteger) multiplier;

@end
