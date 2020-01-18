//
//  Meal.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "Meal.h"

@implementation Meal

- (double)totalOfCalories {
    double total = 0;
    
    for(Item *item in self.itens) {
        total += item.calories;
    }
    
    return total;
}

- (NSString *)showDetails {
    NSString *msg = [NSString stringWithFormat:@"\nFelicidade: %i", _happiness];
    
    for(Item *item in _itens) {
        [msg stringByAppendingFormat:@"\n%@ - Calorias: %f", item.name, item.calories];
    }
    
    return msg;
}

@end
