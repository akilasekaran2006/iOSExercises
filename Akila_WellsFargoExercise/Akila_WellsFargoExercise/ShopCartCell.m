//
//  ShopCartCell.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "ShopCartCell.h"
#define kBlueColor [UIColor colorWithRed:82.0/255.0 green:115.0/255.0 blue:185.0/255.0 alpha:1.0];

@implementation ShopCartCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        // Initialization code
        self.addToCartButton.backgroundColor = kBlueColor;
        
    }
    return self;
}

- (IBAction)addToCartTapped:(id)sender {
}
@end
