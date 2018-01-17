//
//  PageControl.h
//  PageControl
//
//  Created by dz on 7/9/2017.
//  Copyright © 2017 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface PageControl : UIControl

@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, assign) IBInspectable CGFloat radius;
@property (nonatomic, assign) IBInspectable CGFloat padding;

@property(nonatomic, assign) IBInspectable NSInteger numberOfPages;
@property(nonatomic, assign) IBInspectable NSInteger currentPage;

@property(nonatomic,strong) IBInspectable UIColor *pageIndicatorTintColor;
@property(nonatomic,strong) IBInspectable UIColor *currentPageIndicatorTintColor;

@property(nonatomic, assign) IBInspectable BOOL hidesForSinglePage;

- (void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated;

@end
