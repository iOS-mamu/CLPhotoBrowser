//
//  CLPhotoBrowserToolBar.h
//  CLPhotoBrowser
//
//  Created by 蔡磊 on 16/2/29.
//  Copyright © 2016年 mamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPhotoBrowserToolBar : UIView
- (instancetype)initWithDeleteCallback: (void(^)())deleteCallback andShareCallback:(void(^)())shareCallback;
@end
