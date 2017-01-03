//
//  CTDisplayview.m
//  Demo
//
//  Created by 小酸奶 on 2016/12/28.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "CTDisplayview.h"
#import "CoreTextUtils.h"

@implementation CTDisplayview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupEvents];
    }
    //设置背景色
    self.backgroundColor = [UIColor whiteColor];
    return  self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // 获取画布上下文，用于后续将内容绘制在画布上
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 将坐标系反转
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
    }
}

- (void)setupEvents {
    UIGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(userTapGestureDetected:)];
    [self addGestureRecognizer:tapRecognizer];
    
    self.userInteractionEnabled = YES;
    
}

- (void)userTapGestureDetected:(UIGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self];
    
    BOOL isTap = [CoreTextUtils touchLinkInView:self atPoint:point data:self.data];
    if (isTap) {
        
        NSString *phoneNumber = [[self.data.content attributedSubstringFromRange:self.data.range] string];
        
        NSString *url=[NSString stringWithFormat:@"telprompt://%@",phoneNumber];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    }
}

@end
