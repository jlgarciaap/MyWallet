//
//  Money.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 22/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"




//Lo  mismo quue en los otros
//@interface Money()
//
//@property (nonatomic) NSInteger amount;
//
//@end

@interface Money()

// Antes de usar el selector en los test para amount teniamos esto
//@property (nonatomic) NSInteger amount;
//Ahora lo hemos cambiado por un objeto para que nos funcione con el selector
@property (nonatomic,strong) NSNumber *amount;




@end

@implementation Money

//En ocasiones normales seria (instancetype) explicacioin en el h
+(id) euroWithAmount: (NSInteger) amount{
    
    return [[Money alloc]initWithAmount:amount currency:@"EUR"];
    
    
}

+(id) dollarWithAmount: (NSInteger) amount{
    
    //return [[Dollar alloc]initWithAmount:amount currency:@"USD"];
    //Antes teniamos instancia del tipo de moneda por la clase
    //ahora con currency no es necesario por eso usamos money
    return [[Money alloc]initWithAmount:amount currency:@"USD"];
    
}


-(id)initWithAmount: (NSInteger) amount currency:(NSString *)currency{
    
    if (self = [super init]){
        
        //_amount = amount;
        //Antes del selector de amount teniamos lo de arriba.
        //Ahora lo corregimos usando lo nuevo de los literales que lo que nos hace
        //es evaluar el contenido y lo empaqueta en lo que necesita o se supone
        // que es
        _amount = @(amount);
        _currency = currency;
        
    }
    
    return self;
}


//Antes devolviamos una instancia de money ahora como es generico para todas
//devolvemos id
//-(Money *) times: (NSInteger) multiplier{
-(id) times: (NSInteger) multiplier{
   
    //Antes de pasar los times de las clases a esta teniamos esto
    //No se deberia llamar si no ser usada por la subclase
    
    //return [self subclassResponsibility:_cmd];
    //_cmd parametro oculto que recibe todo mensaje de
    //objective-c y el numero del selector
    
    //Currency y amount usamos los datos de la propia llamada
    
    Money *newMoney = [[Money alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    
    return newMoney;


}

#pragma mark - OverWritten

//isEqual nos obliga a la larga a sobreescribir el metodo hash
-(BOOL)isEqual:(id)object{
    
    
    return [self amount] == [object amount];
    
}

//Como el metodo hash por defecto es kaka(devuelve la direccion de memoria) por lo que no nos sirve
//para comparar elementos, por ejemplo, lo sobreescribimos
-(NSUInteger) hash{
    
    
    return (NSUInteger) self.amount;
    
}


-(NSString *)description{
    
    
    return [NSString stringWithFormat:@" <%@ %ld",
            [self class],(long)[self amount]];
    
}



@end
