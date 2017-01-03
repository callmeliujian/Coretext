//
//  CoreTextData.h
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//
// 保存由CTFrameParser类生成的CFrameRef实例以及CTFrameRef实际绘制需要的高度

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>


@interface CoreTextData : NSObject

@property (assign, nonatomic) CTFrameRef ctFrame;

// 高度
@property (assign, nonatomic) CGFloat height;

// 宽度
@property (nonatomic, assign) CGFloat width;

@property (strong, nonatomic) NSAttributedString *content;

// 范围
@property (assign, nonatomic) NSRange range;

@end
