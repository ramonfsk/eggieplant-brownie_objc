//
//  ViewController.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealDAO.h"
#import "ItemDAO.h"

@protocol AddMealDelegate <NSObject>

- (void)addMeal:(Meal *)meal;
- (void)updateMeal:(Meal *)meal;

@end

@interface FormMealViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property MealDAO *mealDAO;
@property ItemDAO *itemDAO;

@property id<AddMealDelegate> delegate;

@end

