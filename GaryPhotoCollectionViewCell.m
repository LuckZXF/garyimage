//
//  GaryPhotoCollectionViewCell.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "GaryPhotoCollectionViewCell.h"

@implementation GaryPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _photo.contentMode = UIViewContentModeScaleAspectFill;
        [_photo setClipsToBounds:YES];
        [self createCell];
    }
    return self;
}


- (void)createCell
{
    _photo = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:_photo];
}
@end
