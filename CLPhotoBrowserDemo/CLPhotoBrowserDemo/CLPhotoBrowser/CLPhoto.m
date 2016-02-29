//
//  CLPhoto.m
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import "CLPhoto.h"
@interface CLPhoto ()

@end

@implementation CLPhoto

- (instancetype)initWithImage:(UIImage *)image
{
    if(self = [super init])
    {
        self.image = image;
    }
    return self;
}

- (instancetype)initWithUrl:(NSString *)url
{
    if(self = [super init])
    {
        self.url = url;
    }
    return self;
}

@end
