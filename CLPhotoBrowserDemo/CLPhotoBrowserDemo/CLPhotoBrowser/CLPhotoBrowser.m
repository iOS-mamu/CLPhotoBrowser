//
//  CLPhotoBrowser.m
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import "CLPhotoBrowser.h"
#import "CLPhotoBrowserCell.h"
#import "CLPhotoBrowserToolBar.h"

#import "Masonry.h"

@interface CLPhotoBrowser ()
@property (nonatomic,strong)NSMutableArray * photos;
@property (nonatomic,strong)CLPhotoBrowserToolBar * toolBar;
@end

@implementation CLPhotoBrowser

static NSString * const reuseIdentifier = @"CLPhotoBrowserCellID";

#pragma mark - setter
- (void)setCurrentPhotoIndex:(NSInteger)currentPhotoIndex
{
    _currentPhotoIndex = currentPhotoIndex;
    //collectionView 移动到指定indexPath
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:currentPhotoIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

#pragma mark lazy loading
- (CLPhotoBrowserToolBar *)toolBar
{
    if(_toolBar == nil)
    {
        _toolBar = [[CLPhotoBrowserToolBar alloc]initWithDeleteCallback:^{
            
            //删除回调


        } andShareCallback:^{
            //分享回调
            
                

        

            
        }];
    }
    return _toolBar;
}

#pragma mark view lifetime
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CLPhotoBrowserCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self prepareView];
    [self setupUI];
}

#pragma mark initialize method
+ (instancetype)photobrowserWithPhotos:(NSMutableArray *)photos
{
    //layput
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    

    CLPhotoBrowser * photoBrowser = [[CLPhotoBrowser alloc]initWithCollectionViewLayout:layout];
    
    //config photoBrowser
    photoBrowser.collectionView.pagingEnabled = YES;
    
    photoBrowser.photos = photos;
    return photoBrowser;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CLPhotoBrowserCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.photo = self.photos[indexPath.item];
    
    
    return cell;
}

#pragma mark <UIScrollViewDelegate>
//获取当前cell的indexPath
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 将collectionView在控制器view的中心点转化成collectionView上的坐标
    CGPoint pInView = [self.view convertPoint:self.collectionView.center toView:self.collectionView];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    // 赋值给记录当前坐标的变量
    _currentPhotoIndex = indexPathNow.item;
    NSLog(@"%ld",self.currentPhotoIndex);
    // 更新底部的数据

}


#pragma mark - UI
- (void)prepareView
{
    CGFloat collectionViewH = [UIScreen mainScreen].bounds.size.height;
    CGFloat collectionViewW = [UIScreen mainScreen].bounds.size.width;
    
    self.collectionView.frame = CGRectMake(0, 0,collectionViewW,collectionViewH);
    
    //点击dismiss
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
    [self.view addGestureRecognizer:tap];
}

- (void)setupUI
{
    [self.view addSubview:self.toolBar];
    
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@44);
        
    }];
}

#pragma mark - tap dismiss事件
- (void)dismiss:(UITapGestureRecognizer *)tap
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}


@end
