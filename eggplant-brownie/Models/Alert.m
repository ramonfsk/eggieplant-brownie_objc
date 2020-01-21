//
//  Alert.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 21/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "Alert.h"

@implementation Alert

- (void)showAlert:(NSString *)title :(NSString *)msg :(UIViewController *)viewController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *btnOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:btnOK];
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
