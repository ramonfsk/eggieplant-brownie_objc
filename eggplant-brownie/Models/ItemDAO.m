//
//  ItemDAO.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 13/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "ItemDAO.h"
#import "Item.h"

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

- (void)addItem:(Item *)item {
    [_itens addObject:item];
}

- (void)remItem:(Item *)item {
    [_itens removeObject:item];
}

- (Item *)itemOfIndex:(NSInteger)index {
    return self.itens[index];
}

- (NSInteger)indexOfItem:(Item *)item {
    return [self.itens indexOfObject:item];
}

- (NSMutableArray<Item *> *)getAllItens {
    return _itens;
}

- (NSInteger)totalOfItens {
    return _itens.count;
}

@end
