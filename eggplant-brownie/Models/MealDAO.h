//
//  MealDAO.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meal.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealDAO : NSObject

@property NSMutableArray *meals;

- (NSInteger)total;
- (void)addMeal:(Meal *)meal;
- (void)remMeal:(Meal *)meal;

- (Meal *)mealOfIndex:(NSInteger)index;
- (NSInteger)indexOfMeal:(Meal *)meal;

+ (MealDAO *)mealDAOInstance;

@end

NS_ASSUME_NONNULL_END
