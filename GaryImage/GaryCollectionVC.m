//
//  GaryCollectionVC.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "GaryCollectionVC.h"
#import "UIImageView+WebCache.h"
#import "GaryCollectionCellCollectionViewCell.h"
#import "GaryTools.h"
#define Screen_Width    [UIScreen mainScreen].bounds.size.width
#define Screen_Height   [UIScreen mainScreen].bounds.size.height
#define RatioX         (MIN(Screen_Width,Screen_Height))/320.0
#define RatioY         (((MAX(Screen_Height,Screen_Width))<568.0)?1.0:(MAX(Screen_Height,Screen_Width)/568.0))
#define RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]

@interface GaryCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSInteger currentIndex;
}
@property (nonatomic,strong)NSArray *UrlArray;
@property (nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic, strong) UIView *titleview;
@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UIView *horizonSperatorView;


@end

@implementation GaryCollectionVC

- (void)viewDidLoad {
    //设置navigation的titleview
    
    
    _UrlArray = @[@"http://pic.maizuo.com/usr/100002721/7a0c061bd985d810bcd5d73446f7d15a.tmp",@"http://pic.maizuo.com/usr/100002721/bd3da7f6a208b8954495326fdaf5c89d.tmp",@"http://pic.maizuo.com/usr/100002721/bec1bbc03c8d10e813fbcc360fbedc20.tmp",@"http://pic.maizuo.com/usr/100002721/7b146f825c4527224c6068d6494c38b4.tmp",@"http://pic.maizuo.com/usr/100002721/8a423ae6fc0d9276c9023dcda953a54a.tmp",@"http://pic.maizuo.com/usr/100002721/b24ea27544efd7ab3084436eb2b4fdbb.tmp",@"http://pic.maizuo.com/usr/100002721/dd7f295af7c5d2375695b9eabfdba783.tmp",@"http://pic.maizuo.com/usr/100002721/4d4b177830f98af3a72d4f3a20cb06fb.tmp",@"http://pic.maizuo.com/usr/100002721/544193eb8d9fe6b00f439c1090ef451c.tmp",@"http://pic.maizuo.com/usr/100002721/b4a082d00ecebfa9310fd27ec6dd3e8e.tmp",@"http://pic.maizuo.com/usr/100002721/2a9705d3207b53ef1f38e4bec7f89578.tmp",@"http://pic.maizuo.com/usr/100002721/e14246b57c11915c0495637c1f6b8d35.tmp",@"http://pic.maizuo.com/usr/100002721/a993bd0b9b15801fa20ee9a04b4a108a.tmp",@"http://pic.maizuo.com/usr/100002721/aa3fb8e2337c7be41989d2113f861cce.tmp",@"http://pic.maizuo.com/usr/100002721/141f6ce1c8b2b8b02c1afc143bb6ff1d.tmp",@"http://pic.maizuo.com/usr/100002721/80110d918be5efff33bdad232247fc22.tmp",@"http://pic.maizuo.com/usr/100002721/d4143280c0102bf15b4731368faaa9cc.tmp"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake(80, 80);
    flowLayout.minimumLineSpacing = 10;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    currentIndex = 1;
    self.automaticallyAdjustsScrollViewInsets = false;
    //cell注册
    [_collectionView registerClass:[GaryCollectionCellCollectionViewCell class] forCellWithReuseIdentifier:@"ZXFCollectionViewCell"];
   // [self.view addSubview:_collectionView];
    _collectionView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 70);
    [self.view addSubview:_collectionView];
   // [self.view addSubview:_scrollview];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_UrlArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GaryCollectionCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZXFCollectionViewCell" forIndexPath:indexPath];
    if (cell)
    {
        [cell.imageView setImageWithURL:[NSURL URLWithString:_UrlArray[indexPath.row]]];
       // [cell.imageView sd_setImageWithPreviousCachedImageWithURL:_UrlArray[indexPath.row] placeholderImage:nil options:0 progress:nil completed:nil];
        cell.imageView.tag = indexPath.row + 100;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.imageView.clipsToBounds = YES;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIImageView *myimageView = (UIImageView*)[self.view viewWithTag:indexPath.row + 100];
    
    [GaryTools showImage:myimageView];//调用方法
    
    
}



//- (void)btnClick
//{
//    [[SDImageCache sharedImageCache]clearMemory];
//    [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
//        [_collectionView reloadData];
//    }];
//}


@end

