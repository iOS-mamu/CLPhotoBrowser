//
//  CLPhotoBrowserCell.m
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import "CLPhotoBrowserCell.h"
#import "CLPhoto.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#define kMinScale 1.0
#define kMaxScale 2.0

@interface CLPhotoBrowserCell ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UIImageView * imageView;
@end

@implementation CLPhotoBrowserCell

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self prepareView];
        [self setupUI];
    }
    return self;
}

#pragma mark - lazy loading
- (UIScrollView *)scrollView
{
    if(_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc]init];
    }
    return _scrollView;
}

- (UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

#pragma mark - setter
- (void)setPhoto:(CLPhoto *)photo
{
    
    [self resizeToOrigin];
    if(photo.image)
    {
        UIImage * image = photo.image;
        self.imageView.image = image;
        
    }
    
    else
    {
        NSURL * url = [[NSURL alloc]initWithString:photo.url];
        [self.imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            CGFloat imageView_X = (image.size.width > self.contentView.frame.size.width) ? self.contentView.frame.size.width : image.size.width;
            CGFloat imageView_Y=(image.size.height > self.contentView.frame.size.height) ? self.contentView.frame.size.height : image.size.height;
            CGFloat origin;
            //保持图片的比例
            if(image.size.width > self.contentView.frame.size.width){
                origin = self.contentView.frame.size.width/image.size.width;
                imageView_Y = image.size.height*origin;
            }
            
            self.imageView.frame = CGRectMake((self.contentView.frame.size.width-imageView_X)/2, (self.contentView.frame.size.height-imageView_Y)/2, imageView_X, imageView_Y);
            
        }];
        
    }
}

#pragma mark - UI
- (void)prepareView
{
    self.contentView.backgroundColor = [UIColor blackColor];
}

- (void)setupUI
{
    
    //add subviews
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
    
    //frame
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    //contentMode fit
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = [UIScreen mainScreen].bounds.size;
    
    self.scrollView.maximumZoomScale=kMaxScale;
    
    self.scrollView.minimumZoomScale=kMinScale;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    
}

- (void)resizeToOrigin
{
    self.scrollView.zoomScale = 1;
}

#pragma mark - UIScrollView delegate

//缩放居中显示代码
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    CGRect imageViewFrame = self.imageView.frame;
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    if (imageViewFrame.size.height > screenBounds.size.height) {
        imageViewFrame.origin.y = 0.0f;
    } else {
        imageViewFrame.origin.y = (screenBounds.size.height - imageViewFrame.size.height) / 2.0;
    }
    self.imageView.frame = imageViewFrame;
}

//返回需要缩放的view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


@end
