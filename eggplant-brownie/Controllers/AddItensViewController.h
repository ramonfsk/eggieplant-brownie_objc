//
//  AddItensViewController.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 16/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddItemDelegate <NSObject>

- (void)addItem:(Item *)item;

@end

@interface AddItensViewController : UIViewController

@property id<AddItemDelegate> delegate;

- (void)initWithDelegate:(id)delegate;

=======

NS_ASSUME_NONNULL_BEGIN

@interface AddItensViewController : UIViewController

>>>>>>> master
@end

NS_ASSUME_NONNULL_END
