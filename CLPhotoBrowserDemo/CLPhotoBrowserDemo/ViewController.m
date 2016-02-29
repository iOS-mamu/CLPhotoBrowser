//
//  ViewController.m
//  CLPhotoBrowserDemo
//
//  Created by 蔡磊 on 16/2/29.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import "ViewController.h"
#import "CLPhotoBrowser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    
    UILabel * label = [[UILabel alloc]init];
    label.text = @"点我弹出照片浏览器";
    label.textColor = [UIColor blackColor];
    label.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.5);
    [label sizeToFit];
    
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CLPhoto * p1 = [[CLPhoto alloc]initWithUrl:@"http://img3.imgtn.bdimg.com/it/u=3841157212,2135341815&fm=21&gp=0.jpg"];
    CLPhoto * p2 = [[CLPhoto alloc]initWithUrl:@"http://pic13.nipic.com/20110415/1347158_132411659346_2.jpg"];
    CLPhoto * p3 = [[CLPhoto alloc]initWithUrl:@"http://pic.nipic.com/2007-11-08/2007118192311804_2.jpg"];
    CLPhoto * p4 = [[CLPhoto alloc]initWithUrl:@"http://img3.redocn.com/20101213/20101211_0e830c2124ac3d92718fXrUdsYf49nDl.jpg"];
    NSMutableArray * photos = [NSMutableArray arrayWithArray:@[p1,p2,p3,p4]];
    CLPhotoBrowser * photoBrowser = [CLPhotoBrowser photobrowserWithPhotos:photos];
    [self presentViewController:photoBrowser animated:NO completion:^{
        
    }];
}

@end
