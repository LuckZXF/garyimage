//
//  ImageViewViewController.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "ImageViewViewController.h"
static CGSize AssetGridThumbnailSize;
@interface ImageViewViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) PHCachingImageManager *imageManager;
@property CGRect previousPreheatRect;
@end

@implementation ImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake(80, 80);
    flowLayout.minimumLineSpacing = 10;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255 alpha:0.12];
    self.automaticallyAdjustsScrollViewInsets = false;
    //cell注册
    
    [_collectionView registerClass:[GaryPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"ZXFCollectionViewCell1"];
    // [self.view addSubview:_collectionView];
    _collectionView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [self.view addSubview:_collectionView];
    
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    self.imageManager = [[PHCachingImageManager alloc] init];
    [self resetCachedAssets];
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cellSize = ((UICollectionViewFlowLayout *)flowLayout).itemSize;
    AssetGridThumbnailSize = CGSizeMake(cellSize.width * scale, cellSize.height * scale);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetCachedAssets {
    [self.imageManager stopCachingImagesForAllAssets];
    self.previousPreheatRect = CGRectZero;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assetsFetchResults.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GaryPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZXFCollectionViewCell1" forIndexPath:indexPath];
    if (cell)
    {
        PHAsset *asset = self.assetsFetchResults[indexPath.item];
        // Add a badge to the cell if the PHAsset represents a Live Photo.
        // Request an image for the asset from the PHCachingImageManager.
        cell.representedAssetIdentifier = asset.localIdentifier;
        
       // cell.photo.image = nil;
        [self.imageManager requestImageForAsset:asset
                                     targetSize:AssetGridThumbnailSize
                                    contentMode:PHImageContentModeAspectFill
                                        options:nil
                                  resultHandler:^(UIImage *result, NSDictionary *info) {
                                          cell.photo.image = result;
                                          cell.photo.tag = indexPath.row + 100;
                                          cell.photo.contentMode = UIViewContentModeScaleAspectFill;
                                          cell.photo.clipsToBounds = YES;
                                  }];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIImageView *myimageView = (UIImageView*)[self.view viewWithTag:indexPath.row + 100];
    
    [GaryTools showImage:myimageView];//调用方法
    
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
