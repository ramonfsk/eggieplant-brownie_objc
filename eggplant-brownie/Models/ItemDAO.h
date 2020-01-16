//
//  ItemDAO.h
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemDAO : NSObject

@property NSMutableArray *itens;

+ (ItemDAO *)itemDAOInstance;

@end

NS_ASSUME_NONNULL_END
