//
//  GaryPhotoCollectionViewCell.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "GaryPhotoCollectionViewCell.h"

@implementation GaryPhotoCollectionViewCell
- (void)awakeFromNib {
    // Initialization code
    _photo.contentMode = UIViewContentModeScaleAspectFill;
    [_photo setClipsToBounds:YES];
    
}
@end
