//
//  Alert.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 21/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Alert : NSObject

- (void)showAlert:(NSString *)title :(NSString *)msg :(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
