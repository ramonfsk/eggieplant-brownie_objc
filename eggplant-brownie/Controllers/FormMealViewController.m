//
//  ViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "FormMealViewController.h"
#import "MealsTableViewController.h"
#import "Meal.h"
#import "Item.h"

@interface FormMealViewController ()

@property IBOutlet UITextField *txtfName;
@property IBOutlet UITextField *txtfHappiness;

@property Meal *meal;
@property Item *item;
@property NSMutableArray<Item *> *selectedItens;

@property NSArray *arrayS;

- (IBAction)add;

@end

@implementation FormMealViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"Cadastro de Refeição";
    
    self.mealDAO = [MealDAO mealDAOInstance];
    //_delegate = [MealsTableViewController mealsTableViewInstance];
    
    _arrayS = @[@"Molho de Tomate", @"Milho", @"Cebola"];
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

//MARK: Tabela de selecao de itens
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    //Meal *meal = [self.dao mealOfIndex:indexPath.row];
    
    cell.textLabel.text = _arrayS[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //NSInteger numRow = (int)indexPath.row;
        
        Item *tmp = [Item new];
        [tmp setName:_arrayS[indexPath.row]];
        [tmp setCalories:0.0];
        [_selectedItens addObject:tmp];
        NSLog(@"Item: %@", [_selectedItens[indexPath.row] name]);
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        NSInteger numRow = (int)indexPath.row;
        [_selectedItens removeObject:[_mealDAO itemOfIndex:numRow]];
        
        for(Item *item in _selectedItens) {
            NSLog(@"%@", item.name);
        }
    }
    //NSLog(@"Selecionei a linha %li", (long)indexPath.row);
}

@end
