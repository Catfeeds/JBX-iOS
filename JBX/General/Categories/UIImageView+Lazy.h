//
//  UIImageView+Lazy.h
//  JBX
//
//  Created by 证 on 2017/12/7.
//  Copyright © 2017年 证. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Lazy)
+ (UIImageView*)initWithImageViewWithFrame:(CGRect)rect
                             withImageName:(NSString*)imageName;
@end
