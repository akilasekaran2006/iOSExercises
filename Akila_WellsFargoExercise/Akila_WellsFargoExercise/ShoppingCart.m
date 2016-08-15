//
//  ShoppingCart.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart


+(id )sharedCart {
    static dispatch_once_t onceToken;
    static ShoppingCart *sharedCart = nil;
    dispatch_once(&onceToken, ^{
        sharedCart = [[ShoppingCart alloc] init];
        sharedCart.products = [[NSMutableArray alloc]init];
    });
    return sharedCart;
}

- (void) addProduct:(Product *)product{
    
    [self.products addObject:product];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCart" object:nil];
}

- (void) removeProducts:(NSSet *)objects{
    
    [self.products removeAllObjects];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCart" object:nil];
}

- (void) removeProduct:(Product *)product{
    
    for(Product *eachProduct in self.products){
        if([eachProduct isEqual:product]){
            [self.products removeObject:product];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCart" object:nil];
        }
    }
}

@end
