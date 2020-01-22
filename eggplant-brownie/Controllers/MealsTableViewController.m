//
//  MealsTableViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "MealsTableViewController.h"
#import "MealDAO.h"
#import "Alert.h"

@interface MealsTableViewController ()

@property MealDAO *mealDAO;

@end

@implementation MealsTableViewController

static MealsTableViewController *defaultMealsTableView = nil;

- (void)viewDidLoad {
    self.navigationItem.title = @"Refeicoes";
    _mealDAO = [MealDAO mealDAOInstance];
    
    NSURL *dir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    dir = [dir URLByAppendingPathComponent:@"meal"];
    NSLog(@"%@", dir);
    
    NSData *data = [NSData dataWithContentsOfURL:dir];
    //_mealDAO.meals = [NSKeyedUnarchiver unarchiveTopLevelObjectWithData:data error:nil];
    _mealDAO = [NSKeyedUnarchiver unarchivedObjectOfClass:[MealDAO class] fromData:data error:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    //o código abaixo garante que a tabela recupere os dados antes de ser apresentada.
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mealDAO.totalOfMeals;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    Meal *meal = [_mealDAO mealOfIndex:indexPath.row];
    
    cell.textLabel.text = meal.name;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showDetailsCell:)];
    
    [cell addGestureRecognizer:longPress];
    
    return cell;
}

- (void)addMeal:(Meal *)meal {
    NSLog(@"cheguei aqui, preparando para add uma nova refeicao");
    [_mealDAO addMeal:meal];
    
    NSURL *dir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    dir = [dir URLByAppendingPathComponent:@"meal"];
    //NSLog(@"%@", dir);
    
    [[NSKeyedArchiver archivedDataWithRootObject:_mealDAO requiringSecureCoding:NO error:nil] writeToURL:dir atomically:YES];
    
    //Dessa forma a tableview só atualiza se eu adicionar algo via tela, em vez de recuperar de um BD
    //[self.tableView reloadData];
    NSLog(@"cntMeals: %lu", _mealDAO.totalOfMeals);
    //NSLog(@"cntItens: %lu", _mealDAO.totalOfItens);
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
        //NSLog(@"longpress funfou mulek doido!");
        UITableViewCell *cell = (UITableViewCell *)gesture.view;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Meal *meal = [_mealDAO mealOfIndex:indexPath.row];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:meal.name message:[meal showDetails] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *btnOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction *btnRemove = [UIAlertAction actionWithTitle:@"Remover" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
            [self.mealDAO remMeal:self.mealDAO.meals[indexPath.row]];
            [self.tableView reloadData];
        }];
        
        [alert addAction:btnOK];
        [alert addAction:btnRemove];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        NSLog(@"longpress ref: %@", [_mealDAO mealOfIndex:indexPath.row].name);
    }
}

@end
