//
//  LocalImageList.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GaryTableViewCell.h"
#import "ImageViewViewController.h"

@protocol garydelegate <NSObject>

@optional
-(void) pushview:(ImageViewViewController *)vc;

@end

@interface LocalImageList : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) id<garydelegate> delegate;

@end
