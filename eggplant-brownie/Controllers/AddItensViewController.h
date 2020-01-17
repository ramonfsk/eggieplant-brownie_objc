//
//  AddItensViewController.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 17/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddItemDelegate <NSObject>

- (void)addItem:(Item *)item;

@end

@interface AddItensViewController : UIViewController

@property id<AddItemDelegate> delegate;

- (void)initWithDelegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
