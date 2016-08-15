//
//  ShopCartCell.h
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"
#import "Product.h"

@interface ShopCartCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *productName;

@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@property (strong, nonatomic) Product *product;
- (IBAction)addToCartTapped:(id)sender;
@end
