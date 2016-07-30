//
//  Broker.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 26/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "Broker.h"


@interface Broker()



@end

@implementation Broker

-(id)init{
    
    if(self = [super init]){
        
        
        //Copia mutable del diccionario
        _rates = [@{}mutableCopy];
    }
    
    return self;
    
}


-(Money *)reduce:(id<Money>) money toCurrency: (NSString *) currency{

    
    //*------Pertenece a fase green en plan de pasar como sea aunque sea mal------*/
    //Empezamos por una solucion rapida (fase green), es decir cualquier cosa
    //para que pase el test
    
    //return money;
    
    //----------------------------------------------------------------------//
    
    //double dispatch
    
    return [money reduceToCurrency:currency withBroker:self];
    
        
}

// $10 == €5 con tasa de 2:1. Esto por no gestionar numeros en float
-(void) addRate:(double) rate fromCurrency:(NSString*)fromCurrency toCurrency:(NSString*) toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
    
    [self.rates setObject:@(1/rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    
}


#pragma mark - utils

//Metodo para pasar de un currency a otro
-(NSString *) keyFromCurrency:(NSString *)fromCurrency toCurrency: (NSString *)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency,toCurrency];
    
    
}

#pragma mark - Rates

-(void) parseJSONRates:(NSData *) json{
    
    NSError *err = nil;
    
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    

    if (obj != nil){
        //Parseamos los rates y los añadimos al broker
        
    } else {
        //no hemos recibido nada la cagamos
        [NSException raise:@"NoRatesInJSONException" format:@"JSON must carry some data!"];
        
    }
    
}





@end
