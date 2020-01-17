//
//  MealDAO.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "MealDAO.h"

@interface MealDAO () 

@property NSMutableArray<Item *> *itens;

@end

@implementation MealDAO

static MealDAO *defaultDAO = nil;

- (id)init {
    self = [super init];
    if(self) {
        self.meals = [NSMutableArray new];
        self.itens = [NSMutableArray new];
    }
    
    return self;
}

+ (MealDAO *)mealDAOInstance {
    if(!defaultDAO) {
        defaultDAO = [MealDAO new];
    }
    
    return defaultDAO;
}

- (NSInteger)totalOfMeals {
    return self.meals.count;
}

- (void)addMeal:(Meal *)meal {
    [self.meals addObject:meal];
}

- (void)remMeal:(Meal *)meal {
    [self.meals removeObject:meal];
}

- (Meal *)mealOfIndex:(NSInteger)index {
    return self.meals[index];
}

- (NSInteger)indexOfMeal:(Meal *)meal {
    return [self.meals indexOfObject:meal];
}

- (void)addItem:(Item *)item {
    [_itens addObject:item];
}

- (void)remItem:(Item *)item {
    [_itens removeObject:item];
}

- (Item *)itemOfIndex:(NSInteger)index {
    return self.itens[index];
}

- (NSInteger)indexOfItem:(Item *)item {
    return [self.itens indexOfObject:item];
}

- (NSMutableArray<Item *> *)getAllItens {
    return _itens;
}

- (NSInteger)totalOfItens {
    return _itens.count;
}

@end
