//
//  Money-Private.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 23/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

//En este header lo que hacemos es poner propiedades privadas, como la de
//amount antes estaba en todos los m pero hacia que si intentabamos refactorizar
//y luego heredar esta propiedad no la heredabamos usabamos la propia del m
//


#import "Money.h"
@import Foundation;

@interface Money()

// Antes de usar el selector en los test para amount teniamos esto
//@property (nonatomic) NSInteger amount;
//Ahora lo hemos cambiado por un objeto para que nos funcione con el selector
@property (nonatomic,strong) NSNumber *amount;
    
    


@end