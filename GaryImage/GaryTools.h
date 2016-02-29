//
//  GaryTools.h
//  GaryImage
//
//  Created by 赵希帆 on 16/2/29.
//  Copyright © 2016年 赵希帆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageExtras)

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

@end

@interface GaryTools : NSObject<UIGestureRecognizerDelegate>

+(void)showImage:(UIImageView*)ImageView;
+(void)hideImage:(UITapGestureRecognizer*)tap;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize; 
@end
