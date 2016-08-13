//
//  StoreViewController.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/13/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreViewCell.h"

@interface StoreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic, assign) CGPoint lastOffset;
@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(276, 192);
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.dataSourceArray = [NSMutableArray arrayWithObjects:@"fruits1",@"fruits2",@"fruits3",@"fruits4",nil];

    self.pageControl.numberOfPages = self.dataSourceArray.count;
    
    id firstItem = [self.dataSourceArray firstObject];
    id lastItem = [self.dataSourceArray lastObject];
    
    NSMutableArray *workingArray = [self.dataSourceArray mutableCopy];
    [workingArray insertObject:lastItem atIndex:0];
    [workingArray addObject:firstItem];
    self.dataSourceArray = workingArray;
    
//    [self.collectionView scrollRectToVisible:CGRectMake(276, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height) animated:YES];
    [self.collectionView setContentOffset:CGPointMake(276, 0) animated:NO];
    
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
