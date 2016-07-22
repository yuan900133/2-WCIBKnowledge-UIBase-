//
//  YWCDrawPictrue.m
//  WCIBKnowledge
//
//  Created by 袁武昌 on 16/7/22.
//  Copyright © 2016年 yuan.com. All rights reserved.
//

#import "YWCDrawPictrue.h"

@implementation YWCDrawPictrue

//作用:专门进行绘图.
//什么时候调用:(系统帮我们调用还是需要手动调用?)是系统帮我们自动调用.当View显示的时候调用.
//参数rect:是当前View的Bounds
- (void)drawRect:(CGRect)rect {
   
    //1.获取图形上下文.()无论是获取上下文,还是创建上下文都是以 UIGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘制图形(描述路径)贝瑟尔路径.
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1,设置路径的起点.
    [path moveToPoint:CGPointMake(20, 250)];
    //2.2,添加一根到路径的终点.
    [path addLineToPoint:CGPointMake(250, 20)];
    //一条路径可以描述多条线.
    //    [path moveToPoint:CGPointMake(20, 280)];
    //    [path addLineToPoint:CGPointMake(250, 50)];
    //把上条线的终点当作是下一条线起点.
    [path addLineToPoint:CGPointMake(150, 250)];
    
    //3.把路径保存到上下文.
    //UIKit:path ->   CoreGraphics:path
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文当中内容渲染到View. stroke(描边)  fill(填充)
    CGContextStrokePath(ctx);
    
    
}


@end
