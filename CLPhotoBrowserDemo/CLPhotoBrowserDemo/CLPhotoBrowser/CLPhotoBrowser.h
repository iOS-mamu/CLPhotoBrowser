//
//  CLPhotoBrowser.h
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLPhoto.h"

@interface CLPhotoBrowser : UICollectionViewController
//init method
+ (instancetype)photobrowserWithPhotos:(NSMutableArray *)photos;

//current photo index
@property (nonatomic,assign)NSInteger currentPhotoIndex;

@end
