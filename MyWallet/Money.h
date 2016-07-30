//
//  Money.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;

@protocol Money <NSObject>

-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency;

//Antes devolviamos una instancia de money ahora como es generico para todas
//devolvemos id
//-(Money *) times: (NSInteger) multiplier;

//Esto devolveria algo que implemente el protocolo Money
-(id<Money>) times: (NSInteger) multiplier;

//Metodo para sumar entre monedas. Lo que hacemos es pasarle el segundo money en un metodo y realizamos la suma

-(id<Money>) plus: (Money *) other;

-(id<Money>)reduceToCurrency: (NSString*) currency withBroker:(Broker *) broker;


@end

@interface Money : NSObject <Money>

//Usamos estos metodos de clase para evitar repetirnos en dollar y euro con su
//instanciacion

//Con (instancetype) indicamos que devolvemos una instancia de nuestra propia clase
//en este caso seria de Money. Esto seria lo normal pero en situaciones como esta
//ponemos ID para que el compilador devuelva el objeto que necesita



@property (nonatomic, readonly) NSString *currency;

//POnemos que hacia fuera sea solo readonly
@property (nonatomic,strong, readonly) NSNumber *amount;

//+(instancetype) euroWithAmount: (NSInteger) amount;

+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;


@end
