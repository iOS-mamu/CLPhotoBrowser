//
//  CLPhotoBrowserCell.h
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/22.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLPhoto;
@interface CLPhotoBrowserCell : UICollectionViewCell
@property (nonatomic,strong)CLPhoto * photo;

- (void)resizeToOrigin;
@end
