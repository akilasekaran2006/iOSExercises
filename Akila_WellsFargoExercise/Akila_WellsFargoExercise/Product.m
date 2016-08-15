//
//  Product.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id) init{
    if(self = [super init]){
        
    }
    return self;
}

- (id) initWithProduct:(NSString *)name price:(double )price andURL:(NSString *)url{
    if(self = [super init]){
        
        self.productName = name;
        self.productPrice = price;
        self.productPicURL = url;
    }
    
    return self;
}
@end
