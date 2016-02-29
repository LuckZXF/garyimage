//
//  ImageViewViewController.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "GaryCollectionCellCollectionViewCell.h"
#import "GaryPhotoCollectionViewCell.h"
#import "GaryTools.h"

@interface ImageViewViewController : UIViewController
@property(nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) PHFetchResult *assetsFetchResults;
@property (nonatomic, strong) PHAssetCollection *assetCollection;
@property (strong, nonatomic) NSString *navigationTitle;
@end
