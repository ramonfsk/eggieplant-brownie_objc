//
//  ItemDAO.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "ItemDAO.h"

@implementation ItemDAO

static ItemDAO *defaultDAO = nil;

- (id)init {
    self = [super init];
    if(self)
        self.itens = [NSMutableArray new];
    
    return self;
}

+ (ItemDAO *)itemDAOInstance {
    if(!defaultDAO)
        defaultDAO = [ItemDAO new];
    
    return defaultDAO;
}

@end
