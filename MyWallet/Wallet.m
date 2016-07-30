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
@property (nonatomic,strong) NSMutableDictionary *dictMoneys;

@end

@implementation Wallet

-(NSUInteger) count{
    
    return [self countInSection:0];

    
    
}

-(NSUInteger) currenciesCount{
    
    return [self.currencies count];
    
}

-(NSUInteger) countInSection:(NSInteger)section{
    
    NSArray *countSection = [self.dictMoneys objectForKey:[self.currencies objectAtIndex:section]];
   
    
    return [countSection count];
}

-(id)initWithAmount: (NSInteger) amount currency: (NSString *) currency{
    
    

    
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

-(id<Money>) plus: (Money *) other{
    
    //Aqui simplemente añadimos el nuevo money al array
    if([self.dictMoneys objectForKey:other.currency] == nil){
        
        NSMutableArray *moneyOfSectionArray = [NSMutableArray array];
        [moneyOfSectionArray addObject:other];
        
        [self.dictMoneys setObject:moneyOfSectionArray forKey:other.currency];
        
    } else {
        
        NSMutableArray *moneyOfSectionArray = [self.dictMoneys objectForKey:other.currency];
        
        [moneyOfSectionArray addObject:other];
        
        [self.dictMoneys setObject:moneyOfSectionArray forKey:other.currency];
    }
    
    //[self.moneys addObject:other];
    
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
    
    if(indexPath.section == self.currenciesCount){
        
        Money *result = [[Money alloc] init];
        
        for (NSString *eachCurrency in self.dictMoneys){
            
            for (Money *each in [self.dictMoneys objectForKey:eachCurrency]){
                
                result = [result plus: [each ]];
                
            }
        }
        
        return result;
        
    }
    
    
}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    [nc addObserver:self selector:@selector(dumpToDisk:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    
    
}

-(void) dumpToDisk:(NSNotification *) notification{
    
    
}

@end
