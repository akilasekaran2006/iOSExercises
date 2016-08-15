//
//  Product.h
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic,strong) NSString *productName;
@property (nonatomic,assign) double productPrice;
@property (nonatomic, strong) NSString *productPicURL;
@property (nonatomic,strong) NSMutableArray *cartArray;
- (id) initWithProduct:(NSString *)name price:(double )price andURL:(NSString *)url;

@end
