//
//  CTFrameParser.h
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//
// 生成最后绘制界面需要的CTFrameRef实例

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"

@interface CTFrameParser : NSObject

+ (CoreTextData *)parseContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig *)config;

@end
