//
//  Wallet.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 27/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "Wallet.h"
#import "Broker.h"
@import UIKit;

@interface Wallet()

@property (nonatomic,strong) NSMutableArray *moneys;
//Lo usamos para guardar los moneys
@property (nonatomic,strong) NSMutableArray *currencies;

@property (nonatomic, strong) Broker *broker;

@end

@implementation Wallet

-(NSUInteger) count{
    
    return [self countInSection:0];

    
    
}

-(NSUInteger) currenciesCount{
    
    return [self.currencies count];
    
}

-(NSUInteger) countInSection:(NSInteger)section{
    
    if (section >= [self currenciesCount]){
        
        
        return 1;
        //return [self.dictMoneys count];
    }

    
    NSArray *countSection = [self.dictMoneys objectForKey:[self.currencies objectAtIndex:section]];
   
    
    return countSection.count;
}



//Init para la tabla(necesitamos un broker para poder hacer ciertas cosas)
-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency broker:(Broker *)broker{
    
    
    
    if(self = [super init]){
        Money *money = [[Money alloc]initWithAmount:amount currency:currency];
        
        _broker = broker;
        
        if(_dictMoneys == nil){
            
            //inicializamos el array
            
            _dictMoneys = [NSMutableDictionary dictionary];
            
        }
        
        
        if( [_dictMoneys objectForKey:currency] == nil){
            
            _moneys = [NSMutableArray array];
            [_moneys addObject:money];
            [_dictMoneys setObject:_moneys forKey:currency];
            
        } else {
            
            NSMutableArray *moneyOfSectionArray = [_dictMoneys objectForKey:currency];
            
            [moneyOfSectionArray addObject:money];
            
            [_dictMoneys setObject:moneyOfSectionArray forKey:currency];
            
        }
        
        _currencies = [NSMutableArray array];
        
        if([_currencies containsObject:currency] == false){
            
            [_currencies addObject:currency];
        }
        
    }
    
    return self;
    
}

-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency{
    //Este lo convertimos en init de conveniencia por la necesidad del broker
    
   // return [self initWithAmount:amount currency:currency broker:nil];
    
    if(self = [super init]){
        Money *money = [[Money alloc]initWithAmount:amount currency:currency];
        
       
        
        if(_dictMoneys == nil){
            
            //inicializamos el array
            
            _dictMoneys = [NSMutableDictionary dictionary];
            
        }
        
        
        if( [_dictMoneys objectForKey:currency] == nil){
            
            _moneys = [NSMutableArray array];
            [_moneys addObject:money];
            [_dictMoneys setObject:_moneys forKey:currency];
            
        } else {
            
            NSMutableArray *moneyOfSectionArray = [_dictMoneys objectForKey:currency];
            
            [moneyOfSectionArray addObject:money];
            
            [_dictMoneys setObject:moneyOfSectionArray forKey:currency];
            
        }
        
        _currencies = [NSMutableArray array];
        
        if([_currencies containsObject:currency] == false){
            
            [_currencies addObject:currency];
        }
        
    }
    
    return self;

    
}


-(id<Money>) times: (NSInteger) multiplier{
    
    //A cada elemento dentro del array le pasamos el mensaje times que todos lo entienden
    //y volvemos a guardar de nuevo en el array
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (Money *each in self.moneys){
        
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
        
    }
    
    self.moneys = newMoneys;
    return self;
}

//-(Wallet *) plus: (Money *) other{
//    
//    //Aqui simplemente añadimos el nuevo money al array
//    if([self.dictMoneys objectForKey:other.currency] == nil){
//        
//        NSMutableArray *moneyOfSectionArray = [NSMutableArray array];
//        [moneyOfSectionArray addObject:other];
//        
//        [self.dictMoneys setObject:moneyOfSectionArray forKey:other.currency];
//      
//        //TODOOOOO Aqui hemos metido mas cosas en el plus revisaaarrrr
//        
//        
//    } else {
//         Money *result = [[Money alloc] initWithAmount:0 currency:other.currency];
//        
//        NSMutableArray *moneyOfSectionArray = [self.dictMoneys objectForKey:other.currency];
//        
//        [moneyOfSectionArray addObject:other];
//        
//        for(Money *each in moneyOfSectionArray){
//        
//        result = [result plus: [each reduceToCurrency: other.currency withBroker:self.broker]];
//        
//        }
//        [self.dictMoneys setObject:result forKey:other.currency];
//    }
//    
//    //[self.moneys addObject:other];
//    
//    return self;
//    
//}

-(id<Money>) plus: (Money *) other{
 
    [self.moneys addObject:other];
    
    return self;
    
}

-(id<Money>)reduceToCurrency: (NSString*) currency withBroker:(Broker *) broker{
    //Esto se lo mandamos a cada uno de los elementos dentro del array de moneys dentro del wallet
    //es decir convertimos todos los elementos dentro del Wallet
    
    Money *result = [[Money alloc] initWithAmount:0 currency:currency];
    
    for (NSString *eachCurrency in self.dictMoneys){
    
        for (Money *each in [self.dictMoneys objectForKey:eachCurrency]){
            
            result = [result plus: [each reduceToCurrency:currency withBroker:broker]];
            
            }
    }
    
    return result;
    
}

-(Money *) moneySelected:(NSIndexPath *) indexPath{
    
    
    
    Money *result = [[Money alloc] init];
    
   
    
    if(indexPath.section >= self.currenciesCount){
    //Si la seccion es total sumamos todo, haciendo reduce y lo devolvemos
        for (NSString *eachCurrency in self.dictMoneys){
            
            for (Money *each in [self.dictMoneys objectForKey:eachCurrency]){
                
                result = [result plus: [each reduceToCurrency:@"EUR" withBroker:self.broker]];
                
            }
        }
        
    }else if (indexPath.row >= [self countInSection:indexPath.section]){
        
         NSArray *moneysInSection = [self.dictMoneys objectForKey:self.currencies[indexPath.section]];
        //Si es seccion existente pero la celda seria la que muestra el total del currencie
        //sumamos las moneys pertinentes
        for (Money *each in moneysInSection){
            
            result = [result plus: [each reduceToCurrency:[self.currencies objectAtIndex:indexPath.section] withBroker:self.broker]];
            
        }
        
    } else{
        //Por el contrario si es una celda normal devolvemos el money pertinente y listo
    
       result = [[self.dictMoneys objectForKey:self.currencies[indexPath.section]] objectAtIndex:indexPath.row];
    }
    
    return result;

}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    [nc addObserver:self selector:@selector(dumpToDisk:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    
    
}

-(void) dumpToDisk:(NSNotification *) notification{
    
    
}

@end
