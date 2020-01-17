//
//  ViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "FormMealViewController.h"
#import "MealsTableViewController.h"
#import "AddItensViewController.h"
#import "Meal.h"
#import "Item.h"

@interface FormMealViewController ()

@property IBOutlet UITextField *txtfName;
@property IBOutlet UITextField *txtfHappiness;
@property IBOutlet UITableView *itensTableView;

@property Meal *meal;
@property Item *item;

@property ItemDAO *itens;
@property NSMutableArray<Item *> *selectedItens;

//@property NSArray *arrayS;

- (IBAction)add;

@end

@implementation FormMealViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"Nova Refeição";
    
    self.mealDAO = [MealDAO mealDAOInstance];
    self.itens = [ItemDAO itemDAOInstance];
    _selectedItens = [NSMutableArray new];
    //_delegate = [MealsTableViewController mealsTableViewInstance];
    
    UIBarButtonItem *btnAdd = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addItensForMeal)];
    
    self.navigationItem.rightBarButtonItem = btnAdd;
    
    //_arrayS = @[@"Molho de Tomate", @"Queijo", @"Molho Apimentado", @"Manjericão"];
}

- (void)add {
    NSLog(@"Botao clicado!");
    //NSLog(@"Capturado os txtfield: %@ | %@", _txtfName.text, _txtfHappy.text);
    _meal = [Meal new];
    _meal.name = _txtfName.text;
    _meal.happiness =  [_txtfHappiness.text intValue];
    NSLog(@"Capturado os txtfield: %@ | %i", _meal.name, _meal.happiness);
    
    [_delegate addMeal:_meal addItens:_selectedItens];
    
    [self.navigationController popViewControllerAnimated:YES];
}

//MARK: Tabela de selecao de itens
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itens.totalOfItens;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    cell.textLabel.text = [_itens itemOfIndex:indexPath.row].name;
    NSLog(@"iae: %@", [_itens itemOfIndex:indexPath.row].name);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //NSInteger numRow = (int)indexPath.row;
        Item *tmp = [Item new];
        [tmp setName:[_itens itemOfIndex:indexPath.row].name];
        [tmp setCalories:[_itens itemOfIndex:indexPath.row].calories];
        NSLog(@"name: %@ | cal: %f", tmp.name, tmp.calories);
        [_selectedItens addObject:tmp];
        //NSLog(@"Item: %@", _arrayS[indexPath.row]);
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        if(_selectedItens.count > 0)
            [_selectedItens removeObjectAtIndex:indexPath.row];
        
        for(Item *item in _selectedItens) {
            NSLog(@"%@", item.name);
        }
    }
    //NSLog(@"Selecionei a linha %li", (long)indexPath.row);
}

- (void)addItensForMeal {
    AddItensViewController *viewController = [AddItensViewController new];
    [viewController initWithDelegate:self];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)addItem:(Item *)item {
    [_itens addItem:item];
    NSLog(@"add caraios: %@", item.name);
    //[_itensTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [_itensTableView reloadData];
    
    for(Item *item in _itens.getAllItens) {
        NSLog(@"%@", item.name);
    }
}

@end
