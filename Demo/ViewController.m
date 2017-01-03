//
//  ViewController.m
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayview.h"
#import "CTFrameParserConfig.h"
#import "UIView+frame.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"

#define RGB(A, B, C)    [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建显示view
    CTDisplayview *disView = [[CTDisplayview alloc] init];
    
    // 配置绘制参数
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    
    // 配置可点击区域
    config.range = NSMakeRange(12, 12);
    
    // 配置文字相关属性
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"您也可以直接拨打客户电话400-890-9009进行投诉"];
    
    [attString addAttribute:NSForegroundColorAttributeName value:RGB(164, 164, 164) range:NSMakeRange(0, attString.length)];
    
    [attString addAttribute:NSForegroundColorAttributeName value:RGB(26, 43, 251) range:config.range];
    
//    CTFontRef font = CTFontCreateWithName(CFSTR("Georgia"), 40, NULL);
//    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)font range:NSMakeRange(0, 3)];
    
    
    CoreTextData *data = [CTFrameParser parseContent:attString config:config];
    
    disView.data = data;
    
    disView.frame = CGRectMake(50, 50, data.width, data.height);
    
    [self.view addSubview:disView];
    
}


@end
