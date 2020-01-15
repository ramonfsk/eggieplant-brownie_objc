//
//  MealsTableViewController.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormMealViewController.h"
#import "MealDAO.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealsTableViewController : UITableViewController<AddMealDelegate>

@property MealDAO *dao;

+ (MealsTableViewController *)mealsTableViewInstance;

@end

NS_ASSUME_NONNULL_END
