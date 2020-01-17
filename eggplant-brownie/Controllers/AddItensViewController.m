//
//  AddItensViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 17/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "AddItensViewController.h"
#import "Item.h"

@interface AddItensViewController ()

@property IBOutlet UITextField *txtfName;
@property IBOutlet UITextField *txtfCalories;

- (IBAction)addItem;

@end

@implementation AddItensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Novo Item";
    // Do any additional setup after loading the view from its nib.
}

- (void)initWithDelegate:(id)delegate {
    _delegate = delegate;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addItem {
    Item *tmp = [Item new];
    tmp.name = _txtfName.text;
    tmp.calories = [_txtfCalories.text doubleValue];
    
    [_delegate addItem:tmp];

    [self.navigationController popViewControllerAnimated:YES];
}

@end
