//
//  MealsTableViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "MealsTableViewController.h"
#import "MealDAO.h"

@implementation MealsTableViewController

static MealsTableViewController *defaultMealsTableView = nil;

- (void)viewDidLoad {
    self.navigationItem.title = @"Refeicoes";
    
    self.dao = [MealDAO mealDAOInstance];
    
//    Meal *tmpMeal = [Meal new];
//    tmpMeal.name = @"Pizza";
//    tmpMeal.happiness = 5;
//    [self.dao addMeal:tmpMeal];
//
//    NSLog(@"qtd: %li", (long)self.dao.total);
}

+ (MealsTableViewController *)mealsTableViewInstance {
    if(!defaultMealsTableView)
        defaultMealsTableView = [MealsTableViewController new];
    
    return defaultMealsTableView;
}

- (void)viewWillAppear:(BOOL)animated {
    //o código abaixo garante que a tabela recupere os dados antes de ser apresentada.
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dao.total;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    Meal *meal = [self.dao mealOfIndex:indexPath.row];
    
    cell.textLabel.text = meal.name;
    
    return cell;
}

- (void)addMeal:(Meal *)meal {
    [_dao addMeal:meal];
    //Dessa forma a tableview só atualiza se eu adicionar algo via tela, em vez de recuperar de um BD
    //[self.tableView reloadData];
    NSLog(@"cntMeals: %li", (long)_dao.total);
}

- (void)updateMeal:(Meal *)meal {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"addMeal"]) {
        FormMealViewController *tableViewController = [segue destinationViewController];
        tableViewController.delegate = self;
        NSLog(@"Achei o id da segue...");
    }
    //Da forma acima, foi utilizado o design pattern delagate e uma view conhece somente os métodos que eu desginar
}

@end
