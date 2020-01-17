//
//  MealsTableViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "MealsTableViewController.h"
#import "MealDAO.h"

@interface MealsTableViewController ()

@property MealDAO *mealDAO;
@property ItemDAO *itemDAO;

@end

@implementation MealsTableViewController

static MealsTableViewController *defaultMealsTableView = nil;

- (void)viewDidLoad {
    self.navigationItem.title = @"Refeicoes";
    
    self.mealDAO = [MealDAO mealDAOInstance];
    self.itemDAO = [ItemDAO itemDAOInstance];
    
//    Meal *tmpMeal = [Meal new];
//    tmpMeal.name = @"Pizza";
//    tmpMeal.happiness = 5;
//    [self.dao addMeal:tmpMeal];
//
//    NSLog(@"qtd: %li", (long)self.dao.total);
}

- (void)viewWillAppear:(BOOL)animated {
    //o código abaixo garante que a tabela recupere os dados antes de ser apresentada.
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mealDAO.totalOfMeals;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    Meal *meal = [self.mealDAO mealOfIndex:indexPath.row];
    
    cell.textLabel.text = meal.name;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showDetailsCell:)];
    
    [cell addGestureRecognizer:longPress];
    
    return cell;
}

- (void)addMeal:(Meal *)meal addItens:(NSMutableArray<Item *> *)itens {
    [_mealDAO addMeal:meal];
    for(Item *item in itens) {
        [_mealDAO addItem:item];
    }
    
    //Dessa forma a tableview só atualiza se eu adicionar algo via tela, em vez de recuperar de um BD
    //[self.tableView reloadData];
    NSLog(@"cntMeals: %i", (int)_mealDAO.totalOfMeals);
    NSLog(@"cntItens: %i", (int)_mealDAO.totalOfItens);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"addMeal"]) {
        FormMealViewController *tableViewController = [segue destinationViewController];
        tableViewController.delegate = self;
        //NSLog(@"Achei o id da segue...");
    }
    //Da forma acima, foi utilizado o design pattern delagate e uma view conhece somente os métodos que eu desginar
}

- (void)showDetailsCell:(UILongPressGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longpress funfou mulek doido!");
        UITableViewCell *cell = (UITableViewCell *)gesture.view;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        NSLog(@"longpress ref: %@", [_mealDAO mealOfIndex:indexPath.row].name);
    }
}

@end
