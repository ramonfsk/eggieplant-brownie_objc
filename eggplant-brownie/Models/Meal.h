//
//  Meal.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Meal : NSObject

@property NSString *name;
@property int happiness;
@property NSMutableArray<Item *> *itens;

- (double)totalOfCalories;
- (NSString *)showDetails;

@end

NS_ASSUME_NONNULL_END
