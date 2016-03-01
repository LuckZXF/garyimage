//
//  LocalImageList.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//
//#import <Photos/Photos.h>
#import "LocalImageList.h"
#import "GaryCollectionVC.h"
#import <Photos/Photos.h>
#import "AppDelegate.h"
#define Screen_Width    [UIScreen mainScreen].bounds.size.width
#define Screen_Height   [UIScreen mainScreen].bounds.size.height
@interface LocalImageList ()
@property(nonatomic,strong) UITableView *tv;
@property (nonatomic, strong) NSArray *sectionFetchResults;
@property (nonatomic, strong) PHCachingImageManager *imageManager;
@property CGRect previousPreheatRect;
@end

@implementation LocalImageList

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self getImageList];
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    PHFetchResult *topLevelUserCollections = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    
    // Store the PHFetchResult objects and localized titles for each section.
    //        self.sectionFetchResults = @[allPhotos, smartAlbums, topLevelUserCollections];
    self.sectionFetchResults = @[smartAlbums, topLevelUserCollections];
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    
    self.imageManager = [[PHCachingImageManager alloc] init];
    [self resetCachedAssets];
    // Do any additional setup after loading the view.
}

- (void)resetCachedAssets {
    [self.imageManager stopCachingImagesForAllAssets];
    self.previousPreheatRect = CGRectZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTableView{
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-64)];
    _tv.delegate = self;
    _tv.dataSource = self;
    [self.view addSubview:_tv];
}

- (CGSize)targetSize {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize targetSize = CGSizeMake(70.f * scale, 70.f * scale);
    return targetSize;
    
}

-(void)getImageList{
//    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    
//    for (NSInteger i=0; i<smartAlbums.count; i++) {
//        // 获取一个相册PHAssetCollection
//        PHCollection *collection = smartAlbums[i];
//        if ([collection isKindOfClass:[PHAssetCollection class]]) {
//            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
//            // 从一个相册中获取的PHFetchResult中包含的才是PHAsset
//            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
//            PHAsset *asset = nil;
//            if (fetchResult.count != 0) {
//                asset = fetchResult[0];
//            }
//            
//            // 使用PHImageManager从PHAsset中请求图片
//            PHImageManager *imageManager = [[PHImageManager alloc] init];
//            [imageManager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//                if (result) {
//                    NSLog(@"%@", result);
//                }
//            }];
//        } else {
//            NSAssert1(NO, @"Fetch collection not PHCollection: %@", collection);
//        }
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows = 0;
    PHFetchResult *fetchResult = self.sectionFetchResults[section];
    numberOfRows = fetchResult.count;
    return numberOfRows;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    }
    GaryTableViewCell *cell = (GaryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"GaryTableViewCell"];
    if (cell == nil) {
        cell= (GaryTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"GaryTableViewCell" owner:self options:nil]  lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    PHFetchResult *fetchResult = self.sectionFetchResults[indexPath.section];
    PHCollection *collection = fetchResult[indexPath.row];
    PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
    PHFetchResult *assetsFetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
   // NSLog(@"%lu",(long)indexPath.row);
    //cell.textLabel.text = collection.localizedTitle;
    if (assetsFetchResult.count > 0) {
        [self.imageManager requestImageForAsset:assetsFetchResult[0]
                                     targetSize:[self targetSize]
                                    contentMode:PHImageContentModeAspectFill
                                        options:nil
                                  resultHandler:^(UIImage *result, NSDictionary *info) {
                                      // Set the cell's thumbnail image if it's still showing the same asset.
                                      if (!result) {
                                          return ;
                                      }
                                      cell.imageView1.image = result;
                                      cell.label.text = collection.localizedTitle;
                                  }];
    }
  //  PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    PHFetchResult *fetchResult = self.sectionFetchResults[indexPath.section];
//        // 获取一个相册PHAssetCollection
//        PHCollection *collection = fetchResult[indexPath.row];
//        if ([collection isKindOfClass:[PHAssetCollection class]]) {
//            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
//            // 从一个相册中获取的PHFetchResult中包含的才是PHAsset
//            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
//            PHAsset *asset = nil;
//            if (fetchResult.count != 0) {
//                asset = fetchResult[0];
//            }
//            cell.textLabel.text = collection.localizedTitle;
//            // 使用PHImageManager从PHAsset中请求图片
//           // PHImageManager *imageManager = [[PHImageManager alloc] init];
//            [self.imageManager requestImageForAsset:asset targetSize:[self targetSize] contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//                if (result) {
//                    NSLog(@"%@", result);
//                }
//                cell.imageView.image = result;
//            }];
//        } else {
//            NSAssert1(NO, @"Fetch collection not PHCollection: %@", collection);
//        }

//    cell.textLabel.text = @"123";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PHFetchResult *fetchResult = self.sectionFetchResults[indexPath.section];
    PHCollection *collection = fetchResult[indexPath.row];
    PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
    PHFetchResult *assetsFetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
    if (assetsFetchResult.count > 0) {
        return 85.f;
    }else{
        return 0;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageViewViewController *imgvc = [[ImageViewViewController alloc] init];
    PHFetchResult *fetchResult = self.sectionFetchResults[indexPath.section];
    PHCollection *collection = fetchResult[indexPath.row];
    PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
    PHFetchOptions *allPhotosOptions = [[PHFetchOptions alloc] init];
    allPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    PHFetchResult *assetsFetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:allPhotosOptions];
    imgvc.assetsFetchResults = assetsFetchResult;
    imgvc.assetCollection = assetCollection;
    imgvc.navigationTitle = collection.localizedTitle;
    [_delegate pushview:imgvc];
//    [self presentViewController:imgvc animated:YES completion:nil];
//    UIViewController *imgvc = [[UIViewController alloc] init];
//    imgvc.view.backgroundColor = [UIColor redColor];
//    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:self];
    //[((AppDelegate *)[UIApplication sharedApplication].delegate).nav pushViewController:imgvc animated:YES];
}
@end
