//
//  GaryTableViewCell.m
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import "GaryTableViewCell.h"
#import <Photos/Photos.h>
@implementation GaryTableViewCell

-(void)awakeFromNib{
    _imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [_imageView1 setClipsToBounds:YES];
}


@end
