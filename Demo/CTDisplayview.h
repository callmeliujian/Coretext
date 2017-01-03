//
//  CTDisplayview.h
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//
// 持有CoreTextData类实例，将CTFrameRef绘制到界面上

#import <UIKit/UIKit.h>
#import "CoreTextData.h"

@interface CTDisplayview : UIView

@property (nonatomic, strong) CoreTextData *data;

@end
