//
//  AddItensViewController.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 16/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "AddItensViewController.h"

@interface AddItensViewController ()

@property IBOutlet UITextField *txtfName;
@property IBOutlet UITextField *txtfCalories;

- (IBAction)addItem;

@end

@implementation AddItensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    [self.navigationController popViewControllerAnimated:YES];
}

@end
