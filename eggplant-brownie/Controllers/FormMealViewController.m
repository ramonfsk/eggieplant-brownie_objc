//
//  ViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "FormMealViewController.h"
#import "Meal.h"
#import "MealsTableViewController.h"

@interface FormMealViewController ()

@property IBOutlet UITextField *txtfName;
@property IBOutlet UITextField *txtfHappiness;

@property Meal *meal;


- (IBAction)add;

@end

@implementation FormMealViewController

- (void)viewDidLoad {
    self.dao = [MealDAO mealDAOInstance];
    //_delegate = [MealsTableViewController mealsTableViewInstance];
}

- (void)add {
    NSLog(@"Botao clicado!");
    //NSLog(@"Capturado os txtfield: %@ | %@", _txtfName.text, _txtfHappy.text);
    _meal = [Meal new];
    _meal.name = _txtfName.text;
    _meal.happiness =  [_txtfHappiness.text intValue];
    NSLog(@"Capturado os txtfield: %@ | %i", _meal.name, _meal.happiness);
    
    [_delegate addMeal:_meal];
    
    [self.navigationController popViewControllerAnimated:YES];
}

// MARK: Tabela de selecao de itens

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    //Meal *meal = [self.dao mealOfIndex:indexPath.row];
    
    cell.textLabel.text = @"Molho de Tomate";
    
    return cell;
}

@end
