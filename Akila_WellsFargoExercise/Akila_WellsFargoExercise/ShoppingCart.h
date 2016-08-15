//
//  ShoppingCart.h
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface ShoppingCart : NSObject
@property(nonatomic,strong) NSMutableArray *products;
+(id )sharedCart;
- (void) addProduct:(Product *)product;
- (void) removeProducts:(NSSet *)objects;
- (void) removeProduct:(Product *)product;

@end
