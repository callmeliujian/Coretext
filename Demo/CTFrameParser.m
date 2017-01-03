//
//  CTFrameParser.m
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "CTFrameParser.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "CTFrameParserConfig.h"

@implementation CTFrameParser

+ (CoreTextData *)parseContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig *)config
{
    CoreTextData *data = [[CoreTextData alloc] init];
    
    // 创建CTFramesetterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    // 绘制区域的高度
    CGSize restrictSize = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    
    data.height = coreTextSize.height;
    data.width = coreTextSize.width;
    config.width = coreTextSize.width;
    
    data.content = content;
    
    // 生成CTFrameRef实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:coreTextSize.height];
    
    data.ctFrame = frame;

    data.range = config.range;
    
    // 释放内存
    CFRelease(frame);
    CFRelease(framesetter);
    return data;
}

+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter config:(CTFrameParserConfig *)config height:(CGFloat)height
{
    
    // 创建绘制的区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.width, height));
    
    // 生成CTFrameRef实例
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0,0), path, NULL);
    
    // 释放内存
    CFRelease(path);
    
    return frame;
}

@end
