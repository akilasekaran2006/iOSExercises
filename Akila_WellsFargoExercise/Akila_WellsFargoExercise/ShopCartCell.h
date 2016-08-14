//
//  ShopCartCell.h
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *productName;

@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

- (IBAction)addToCartTapped:(id)sender;
@end
