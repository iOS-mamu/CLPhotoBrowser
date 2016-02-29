//
//  CLPhoto.h
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CLPhoto : NSObject

@property (nonatomic,strong)UIImage * image;
@property (nonatomic,strong)NSString * url;

@property (nonatomic,strong)NSString * COLLECT_ID;

- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithUrl:(NSString *)url;


@end
