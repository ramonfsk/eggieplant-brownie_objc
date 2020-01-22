//
//  Item.m
//  eggplant-brownie
//
//  Created by Ramon Ferreira do Nascimento on 10/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "Item.h"

@implementation Item

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_name forKey:@"Name"];
    [coder encodeDouble:_calories forKey:@"Calories"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    _name = [coder decodeObjectForKey:@"Name"];
    _calories = [coder decodeDoubleForKey:@"Calories"];
    
    return self;
}

@end
