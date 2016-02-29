//
//  GaryPhotoCollectionViewCell.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaryPhotoCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong) UIImageView *photo;
@property(nonatomic, copy) NSString *representedAssetIdentifier;
@end
