//
//  CoreTextUtils.h
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//
// 检测用户的点击是否在我们设置的range上

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreTextData.h"

@interface CoreTextUtils : NSObject

+ (BOOL)touchLinkInView:(UIView *)view atPoint:(CGPoint)point data:(CoreTextData *)data;

@end
