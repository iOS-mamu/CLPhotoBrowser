//
//  CLPhotoBrowserToolBar.m
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/29.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import "CLPhotoBrowserToolBar.h"
@interface CLPhotoBrowserToolBar()
@property (nonatomic,copy)void (^deleteCallback)();
@property (nonatomic,copy)void (^shareCallback)();

@property(nonatomic,strong)UIView * seperatorLine;
@property(nonatomic,strong)UIButton * deleteBtn;
@property(nonatomic,strong)UIButton * sharebBtn;

@end
@implementation CLPhotoBrowserToolBar
#pragma mark - init
- (instancetype)initWithDeleteCallback:(void (^)())deleteCallback andShareCallback:(void (^)())shareCallback
{
    if(self = [super init])
    {
        self.deleteCallback = deleteCallback;
        self.shareCallback = shareCallback;
        
        [self setupUI];
    }
    return self;
}
#pragma mark - lazy loading
- (UIView *)seperatorLine
{
    if(_seperatorLine == nil)
    {
        _seperatorLine = [[UIView alloc]init];
        
    }
    return _seperatorLine;
}

- (UIButton *)sharebBtn
{
    if(_sharebBtn == nil)
    {
        _sharebBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
    }
    return _sharebBtn;
}

- (UIButton *)deleteBtn
{
    if(_deleteBtn == nil)
    {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
    }
    return _deleteBtn;
}

#pragma mark - UI
- (void)setupUI
{
    [self addSubview:self.seperatorLine];
    [self addSubview:self.sharebBtn];
    [self addSubview:self.deleteBtn];
    
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    
    self.seperatorLine.backgroundColor = [UIColor whiteColor];
    self.seperatorLine.frame = CGRectMake(10, 1, SCREEN_WIDTH-20, 1);
    
    [self.sharebBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    NSString * shareBtnPath = [[NSBundle mainBundle]pathForResource:@"PhotoBrowser_Share@2x" ofType:@"png"];
    [self.sharebBtn setImage:[[UIImage alloc]initWithContentsOfFile:shareBtnPath] forState:UIControlStateNormal];
    self.sharebBtn.frame = CGRectMake(SCREEN_WIDTH*0.5, 0, SCREEN_WIDTH*0.5, 44);
    
    [self.deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    NSString * deleteBtnPath = [[NSBundle mainBundle]pathForResource:@"PhotoBrowser_Delete@2x" ofType:@"png"];
    [self.deleteBtn setImage:[[UIImage alloc]initWithContentsOfFile:deleteBtnPath] forState:UIControlStateNormal];
    self.deleteBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH*0.5, 44);
}

#pragma mark - share delete按钮点击事件
- (void)share
{
    
    if(self.shareCallback)
    {
        self.shareCallback();
    }
}

- (void)delete
{
    
    if(self.deleteCallback)
    {
        self.deleteCallback();
    }
}

@end
