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

@property (nonatomic, strong) Broker *broker;

@end

@implementation Wallet

-(NSArray *) getCurrencies{
    
    NSMutableArray *currenciesString = [NSMutableArray array];
    
    for (NSString *each in self.dictMoneys){
        
        [currenciesString addObject:each];
        
    }
    
    return currenciesString;
}

-(NSUInteger) count{
    
    return [self countInSection:0];
}

-(NSUInteger) currenciesCount{
    
    return [self.dictMoneys count];
    
}

-(NSUInteger) countInSection:(NSInteger)section{
    
    if (section >= [self currenciesCount]){
    //Seria la seccion total
        return 1;
    }

    NSArray *countSection = [self.dictMoneys objectForKey:[[self getCurrencies] objectAtIndex:section]];
   
    
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
        
    }
    
    return self;
    
}

-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency{
    //Este lo convertimos en init de conveniencia por la necesidad del broker
    
   return [self initWithAmount:amount currency:currency broker:nil];
    
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

-(id<Money>) plus: (Money *) other{
 
    if([self.dictMoneys objectForKey:other.currency] == nil){
        
        NSMutableArray *arrayMoney = [NSMutableArray array];
        [arrayMoney addObject:other];
        
        [self.dictMoneys setObject:arrayMoney forKey:other.currency];
        
    }else {
        
        NSMutableArray *moneyInDict = [self.dictMoneys objectForKey:other.currency];
        [moneyInDict addObject:other];
        
        [self.dictMoneys setObject:moneyInDict forKey:other.currency];
        
    }
    
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
        
         NSArray *moneysInSection = [self.dictMoneys objectForKey:[self getCurrencies][indexPath.section]];
        //Si es seccion existente pero la celda seria la que muestra el total del currencie
        //sumamos las moneys pertinentes
        for (Money *each in moneysInSection){
           
            
            result = [result plus: [each reduceToCurrency:[[self getCurrencies] objectAtIndex:indexPath.section] withBroker:self.broker]];
            
        }
        
    } else {
        //Por el contrario si es una celda normal devolvemos el money pertinente y listo
    
       result = [[self.dictMoneys objectForKey:[self getCurrencies][indexPath.section]]
                 objectAtIndex:indexPath.row];

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
