//
//  ShopViewController.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopCartCell.h"
#import "Product.h"
#import "ShoppingCart.h"
#import "UIBarButtonItem+Badge.h"

#define kBlueColor [UIColor colorWithRed:82.0/255.0 green:115.0/255.0 blue:185.0/255.0 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:23.0/255.0 green:28.0/255.0 blue:35.0/255.0 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:83.0/255.0 green:88.0/255.0 blue:95.0/255.0 alpha:1.0];

@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    Product *mainProduct; //product object for the first item
    UIBarButtonItem *cartButton; //barbutton item on the right
}
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataSourceArray;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeView];
    //main product on the top
    mainProduct = [[Product alloc] initWithProduct:self.productName.text price:100.0 andURL:@"a.png"];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"updateCart" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        //notification for updating the cart badge on the right bar button item. Product data model is not associated with the product cells yet. The count of the badge is right but values on the shoppingCart are not the actual products as they are not connected yet.)
        cartButton.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[[ShoppingCart sharedCart] products].count] ;
    }];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     ShopCartCell *cell = (ShopCartCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cartCell" forIndexPath:indexPath];
    cell.addToCartButton.tag = indexPath.item;
    cell.product = [self.dataSourceArray objectAtIndex:indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize innerSize = CGSizeMake(collectionView.frame.size.width*0.35,collectionView.frame.size.width/2);
    
    return innerSize;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return collectionView.frame.size.width*0.1;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return collectionView.frame.size.width*0.1;
}

#pragma mark - For the button outside the table view (for the top product item)
- (IBAction)addToCartTapped:(id)sender {
    
    [[ShoppingCart sharedCart] addProduct:mainProduct];
    cartButton.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[[ShoppingCart sharedCart] products].count] ;
}

-(void)cartTapped:(id) sender{
    
}

-(void)customizeView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.navigationItem.title = @"Shop";
    self.navigationController.navigationBar.topItem.title = @"";
    self.addToCartButton.backgroundColor = kBlueColor;
    
    cartButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cart"] style:UIBarButtonItemStyleDone target:self action:@selector(cartTapped:)];
    cartButton.tintColor = kBlueColor;
    [self.navigationItem setRightBarButtonItem:cartButton];
    
    self.dataSourceArray = [NSMutableArray array];
    
    //creating dummy products 
    for (int i =1; i<=10; i++) {
        NSString *productname = [NSString stringWithFormat:@"Fruit%d",i];
        NSString *productpic = [NSString stringWithFormat:@"Fruitpic%d.png",i];
        Product *product = [[Product alloc] initWithProduct:productname price:12.5*i andURL:productpic];
        [self.dataSourceArray addObject:product];
    }
}


@end
