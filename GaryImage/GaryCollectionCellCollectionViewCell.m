//
//  GaryCollectionCellCollectionViewCell.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "GaryCollectionCellCollectionViewCell.h"

@implementation GaryCollectionCellCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createCell];
    }
    return self;
}

- (void)createCell
{
    _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:_imageView];
}

@end
