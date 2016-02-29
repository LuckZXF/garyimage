//
//  ZXFScrollViewController.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GaryCollectionVC.h"
#import "LocalImageList.h"

@interface ZXFScrollViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic, strong) GaryCollectionVC *netVc;
@property(nonatomic, strong) LocalImageList *imagelist;
@end
