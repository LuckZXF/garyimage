//
//  GaryTableViewCell.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaryTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) NSMutableArray *dataSource;
-(void)showImgWithIndexPath:(NSIndexPath *)indexPath andAssetsGroups:(NSArray *)assetGroup;
@end
