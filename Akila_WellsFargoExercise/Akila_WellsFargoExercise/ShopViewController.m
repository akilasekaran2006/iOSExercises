//
//  ShopViewController.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/14/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopCartCell.h"

#define kBlueColor [UIColor colorWithRed:82.0/255.0 green:115.0/255.0 blue:185.0/255.0 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:23.0/255.0 green:28.0/255.0 blue:35.0/255.0 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:83.0/255.0 green:88.0/255.0 blue:95.0/255.0 alpha:1.0];

@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(148, 130);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.navigationItem.title = @"Shop";
    self.navigationController.navigationBar.topItem.title = @"";
    self.addToCartButton.backgroundColor = kBlueColor;
    
    UIBarButtonItem *cartButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cart"] style:UIBarButtonItemStyleDone target:self action:@selector(cartTapped:)];
    cartButton.tintColor = kBlueColor;
    
    [self.navigationItem setRightBarButtonItem:cartButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     ShopCartCell *cell = (ShopCartCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cartCell" forIndexPath:indexPath];
    return cell;
}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CGSize innerSize = CGSizeMake(collectionView.frame.size.width/2, (collectionView.frame.size.width/2)+30);
//    
//    return innerSize;
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addToCartTapped:(id)sender {
}

-(void)cartTapped:(id) sender{
    
}


@end
