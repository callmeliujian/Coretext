//
//  CTFrameParserConfig.h
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//
// 配置绘制的参数：文字颜色、大小、行间距等

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTFrameParserConfig : NSObject

//绘制区域的宽度
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat lineSpace;

// 文字颜色
@property (nonatomic, strong) UIColor *textColor;

// 改变文字颜色的范围，可以相应点击的文字范围
@property (nonatomic, assign) NSRange range;

@end
