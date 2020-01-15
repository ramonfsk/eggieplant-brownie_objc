//
//  ViewController.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "MealDAO.h"

@protocol AddMealDelegate <NSObject>

- (void)addMeal:(Meal *)meal;
- (void)updateMeal:(Meal *)meal;

@end

@interface FormMealViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property MealDAO *dao;

@property id<AddMealDelegate> delegate;

@end

