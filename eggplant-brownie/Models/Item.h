//
//  Item.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject<NSCoding>

@property NSString *name;
@property double calories;

@end

NS_ASSUME_NONNULL_END
