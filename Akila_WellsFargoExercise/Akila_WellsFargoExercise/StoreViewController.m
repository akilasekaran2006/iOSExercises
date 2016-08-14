//
//  StoreViewController.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/13/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//


#import "StoreViewController.h"
#import "StoreViewCell.h"

#define kBlueColor [UIColor colorWithRed:82.0/255.0 green:115.0/255.0 blue:185.0/255.0 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:23.0/255.0 green:28.0/255.0 blue:35.0/255.0 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:83.0/255.0 green:88.0/255.0 blue:95.0/255.0 alpha:1.0];

@interface StoreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic, assign) CGPoint lastOffset;
@property (weak, nonatomic) IBOutlet UIButton *shopButton;
@property (weak, nonatomic) IBOutlet UIButton *eventButton;
@property (weak, nonatomic) IBOutlet UIButton *bookShopperButton;
@property (weak, nonatomic) IBOutlet UIButton *offerButton;
@property (weak, nonatomic) IBOutlet UIButton *loyaltyButton;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(menuTapped:)];
    UIBarButtonItem *profileButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"person"] style:UIBarButtonItemStyleDone target:self action:@selector(profileTapped:)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    [self.navigationItem setRightBarButtonItem:profileButton];
    
    menuButton.tintColor = kBlueColor;
    profileButton.tintColor = kBlueColor;
    
    UIImage *shopImage = [[UIImage imageNamed:@"cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.shopButton setImage:shopImage forState:UIControlStateNormal];
    self.shopButton.tintColor = [UIColor whiteColor];
    self.shopButton.imageEdgeInsets = UIEdgeInsetsMake(0, -190, 0, 0);
    self.shopButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    self.shopButton.backgroundColor = kBlueColor;
    
    UIImage *eventsImage = [[UIImage imageNamed:@"events"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.eventButton setImage:eventsImage forState:UIControlStateNormal];
    self.eventButton.tintColor = [UIColor whiteColor];
    self.eventButton.imageEdgeInsets = UIEdgeInsetsMake(0, -180, 0, 0);
    self.eventButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.eventButton.backgroundColor = kGrayColor;
    
    UIImage *shopperImage = [[UIImage imageNamed:@"bag"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.bookShopperButton setImage:shopperImage forState:UIControlStateNormal];
    self.bookShopperButton.tintColor = [UIColor whiteColor];
    self.bookShopperButton.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    self.bookShopperButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.bookShopperButton.backgroundColor = kGrayColor;
    
    UIImage *offerImage = [[UIImage imageNamed:@"tag"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.offerButton setImage:offerImage forState:UIControlStateNormal];
    self.offerButton.tintColor = [UIColor whiteColor];
    self.offerButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    self.offerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.offerButton.backgroundColor = kGrayColor;
    
    UIImage *loyaltyImage = [[UIImage imageNamed:@"trophy"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.loyaltyButton setImage:loyaltyImage forState:UIControlStateNormal];
    self.loyaltyButton.tintColor = [UIColor whiteColor];
    self.loyaltyButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    self.loyaltyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.loyaltyButton.backgroundColor = kGrayColor;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.dataSourceArray = [NSMutableArray arrayWithObjects:@"fruits1",@"fruits2",@"fruits3",@"fruits4",nil];

    self.pageControl.numberOfPages = self.dataSourceArray.count;
    self.pageControl.pageIndicatorTintColor = kLightGrayColor;
    self.pageControl.currentPageIndicatorTintColor = kBlueColor;
    self.pageControl.currentPage = 3;
    
    id firstItem = [self.dataSourceArray firstObject];
    id lastItem = [self.dataSourceArray lastObject];
    
    NSMutableArray *workingArray = [self.dataSourceArray mutableCopy];
    [workingArray insertObject:lastItem atIndex:0];
    [workingArray addObject:firstItem];
    self.dataSourceArray = workingArray;
    self.collectionView.scrollEnabled = YES;
    
    
//    [self.collectionView scrollRectToVisible:CGRectMake(276, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height) animated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSDictionary *viewsDictionary = @{@"collectionView":self.collectionView,@"pageControl":self.pageControl};
//    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[collectionView]"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:viewsDictionary];
//    [self.collectionView addConstraints:constraint_POS_H];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSourceArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    StoreViewCell *cell = (StoreViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.productImageView.image = [UIImage imageNamed:[self.dataSourceArray objectAtIndex:indexPath.item]];
    return cell;
    
}
- (IBAction)pageControlTrapped:(id)sender {
    
    NSLog(@"Page Tapped");
    UIPageControl *pageControl = sender;
    CGFloat pageWidth = self.collectionView.frame.size.width;
    CGPoint scrollTo = CGPointMake(pageWidth * (pageControl.currentPage+1), 0);
    [self.collectionView setContentOffset:scrollTo animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Tapped cell");
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    CGFloat pageWidth = self.collectionView.frame.size.width;
//    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
//}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    static CGFloat lastContentOffsetX = FLT_MIN;
    
    // We can ignore the first time scroll,
    // because it is caused by the call scrollToItemAtIndexPath: in ViewWillAppear
    if (FLT_MIN == lastContentOffsetX) {
        lastContentOffsetX = scrollView.contentOffset.x;
        return;
    }
    
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    
    CGFloat pageWidth = scrollView.frame.size.width;
    CGFloat offset = pageWidth * (self.dataSourceArray.count - 2);
    
    // the first page(showing the last item) is visible and user's finger is still scrolling to the right
    if (currentOffsetX < pageWidth && lastContentOffsetX > currentOffsetX) {
        lastContentOffsetX = currentOffsetX + offset;
        scrollView.contentOffset = (CGPoint){lastContentOffsetX, currentOffsetY};
    }
    // the last page (showing the first item) is visible and the user's finger is still scrolling to the left
    else if (currentOffsetX > offset && lastContentOffsetX < currentOffsetX) {
        lastContentOffsetX = currentOffsetX - offset;
        scrollView.contentOffset = (CGPoint){lastContentOffsetX, currentOffsetY};
    } else {
        lastContentOffsetX = currentOffsetX;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth - 1;
    NSLog(@"Page : %f",self.collectionView.contentOffset.x);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize innerSize = CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
    
    return innerSize;
    
}

- (void) menuTapped:(id)sender {
    
}

- (void)profileTapped:(id)sender{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
