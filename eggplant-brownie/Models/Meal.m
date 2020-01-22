//
//  Meal.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "Meal.h"

@implementation Meal

static Meal *defaultMeal = nil;

- (id)init {
    self = [super init];
    if(self)
        self.itens = [NSMutableArray new];
    
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_name forKey:@"Name"];
    [coder encodeInt:_happiness forKey:@"Happiness"];
    [coder encodeObject:_itens forKey:@"Itens"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    _name = [coder decodeObjectForKey:@"Name"];
    _happiness = [coder decodeIntForKey:@"Happiness"];
    _itens = [coder decodeObjectForKey:@"Itens"];
    
    return self;
}

- (void)addItem:(Item *)item {
    [_itens addObject:item];
}

- (void)remItem:(Item *)item {
    [_itens removeObject:item];
}

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
        msg = [msg stringByAppendingFormat:@"\n%@ - Calorias: %.2f", item.name, item.calories];
    }
    
    return msg;
}

@end
