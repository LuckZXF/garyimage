//
//  ZXFScrollViewController.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "ZXFScrollViewController.h"
#import "GaryCollectionVC.h"
#define Screen_Width    [UIScreen mainScreen].bounds.size.width
#define Screen_Height   [UIScreen mainScreen].bounds.size.height
#define RatioX         (MIN(Screen_Width,Screen_Height))/320.0
#define RatioY         (((MAX(Screen_Height,Screen_Width))<568.0)?1.0:(MAX(Screen_Height,Screen_Width)/568.0))
#define RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]

@interface ZXFScrollViewController ()
{
    NSInteger currentIndex;
}
@property(nonatomic, strong) UIView *titleview;
@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UIView *horizonSperatorView;
@property(nonatomic, strong) UIScrollView *scrollview;

@end

@implementation ZXFScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!_titleview){
        _titleview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 64)];
    }
    if(!_netVc){
        _netVc = [[GaryCollectionVC alloc] init];
    }
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/2 - 50*RatioX, 20*RatioY, 40*RatioX, 20*RatioY)];
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/2 + 10*RatioX, 20*RatioY, 40*RatioX, 20*RatioY)];
    _label1.text = @"剧照";
    _label2.text = @"相册";
    [_titleview addSubview:_label1];
    [_titleview addSubview:_label2];
    _horizonSperatorView = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width/2 - 55*RatioX, 51, 40*RatioX, 2)];
    _horizonSperatorView.backgroundColor = [UIColor blueColor];
    [_titleview addSubview:_horizonSperatorView];
    self.navigationItem.titleView = _titleview;
   // _netVc = [[GaryCollectionVC alloc] initview];

    //设置可滑动的Scrollview
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    _scrollview.delegate = self;
    _scrollview.pagingEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.directionalLockEnabled = NO;
    [self.view addSubview:_scrollview];
    
    _scrollview.contentSize = CGSizeMake(_scrollview.frame.size.width*2, _scrollview.frame.size.height - 64);
    _netVc.view.frame = CGRectMake(0, 0, _scrollview.frame.size.width, _scrollview.frame.size.height);
    [_scrollview addSubview:_netVc.view];
    _imagelist = [[LocalImageList alloc] init];
   // _imagelist.view.backgroundColor = [UIColor clearColor];
    _imagelist.view.frame = CGRectMake(_scrollview.frame.size.width, 0, _scrollview.frame.size.width, _scrollview.frame.size.height);
    [_scrollview addSubview:_imagelist.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_scrollview.contentOffset.x == 0){
        _horizonSperatorView.frame = CGRectMake(Screen_Width/2 - 55*RatioX, 51, 40*RatioX, 2);
    }
    else if(_scrollview.contentOffset.x == 375.0){
        _horizonSperatorView.frame = CGRectMake(Screen_Width/2 + 5*RatioX, 51, 40*RatioX, 2);
    }
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
