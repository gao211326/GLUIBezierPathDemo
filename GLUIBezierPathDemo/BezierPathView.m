//
//  BezierPathView.m
//  GLUIBezierPathDemo
//
//  Created by 高磊 on 2017/2/15.
//  Copyright © 2017年 高磊. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView



- (void)drawRect:(CGRect)rect {

//    [self gl_bezierPathWithRect:rect];
    [self gl_drawLine];
//    [self gl_drawCorner];
//    [self gl_drawThreeBezier];
//    [self gl_drawBezier];
//    [self gl_drawArc];
//    [self gl_bezierPathWithOvalInRect:rect];
//    [self gl_bezierPathWithRoundedRect:rect];
//    [self gl_speical_bezierPathWithRoundedRect:rect];
}

//画线条
- (void)gl_drawLine
{
    //颜色设置
    [[UIColor redColor]set];

    for (NSInteger i = 0; i < 3; i++)
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        //线条的宽度
        path.lineWidth = 5.0;
        
        [path moveToPoint:CGPointMake(10, (1+i)*40)];
        [path addLineToPoint:CGPointMake(100, (1+i)*40)];
        
//画虚线
//        CGFloat dash[] = {2,6};
//        
//        [path setLineDash:dash count:2 phase:1];
        
        
        //断点样式
        switch (i) {
            case 0:
            {
                //无端点
                path.lineCapStyle = kCGLineCapButt;
            }
                break;
            case 1:
            {
                //圆形端点
                path.lineCapStyle = kCGLineCapRound;
            }
                break;
            case 2:
            {
                //方形端点 和无端点差不多 但是要长一点点
                path.lineCapStyle = kCGLineCapSquare;
            }
                break;
            default:
                break;
        }
        
        [path stroke];
    }
}

//画带角的线
- (void)gl_drawCorner
{
    [[UIColor redColor]set];
    
    for (NSInteger i = 0; i < 3; i++)
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        
        [path moveToPoint:CGPointMake(10, (1+i)*40)];
        [path addLineToPoint:CGPointMake(100, (1+i)*40)];
        [path addLineToPoint:CGPointMake(100, (1+i)*40 + 20)];
        //断点样式
        switch (i) {
            case 0:
            {
                //尖角
                path.lineJoinStyle = kCGLineJoinMiter;
                //这里设为1 因为斜接长度超过了1 所以就自动转化为了kCGLineJoinBevel类型
                //path.miterLimit = 1;
            }
                break;
            case 1:
            {
                //圆角
                path.lineJoinStyle = kCGLineJoinRound;
            }
                break;
            case 2:
            {
                //切角
                path.lineJoinStyle = kCGLineJoinBevel;
            }
                break;
            default:
                break;
        }
        
        [path stroke];
    }
}

//创建三次贝塞尔曲线
- (void)gl_drawThreeBezier
{
    [[UIColor redColor]set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 3.0;
    //起点坐标
    [path moveToPoint:CGPointMake(10, 140)];
    //下面三个点分别为 终点坐标  控制坐标1 控制坐标2
    [path addCurveToPoint:CGPointMake(190, 100) controlPoint1:CGPointMake(100, 50) controlPoint2:CGPointMake(130, 190)];
    [path stroke];
}

//创建二次贝塞尔曲线
- (void)gl_drawBezier
{
    [[UIColor redColor]set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 3.0;
    //起点坐标
    [path moveToPoint:CGPointMake(10, 140)];
    //下面三个点分别为 终点坐标  控制坐标
    [path addQuadCurveToPoint:CGPointMake(190, 100) controlPoint:CGPointMake(100, 50)];
    
    [path stroke];
}

//添加圆弧
- (void)gl_drawArc
{
    [[UIColor redColor]set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 3.0;
    
    //以下参数分别为圆弧的中心坐标  半径 起点  终点 是否顺时针
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50 startAngle:0 endAngle:3 * M_PI_2 clockwise:YES];
    
    [path stroke];
}



//画矩形
- (void)gl_bezierPathWithRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 40, MIN(100, rect.size.width), MIN(100, rect.size.height))];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapButt;
    path.lineJoinStyle = kCGLineJoinMiter;
    
    [path stroke];
}

//在rect内创建内切的曲线
- (void)gl_bezierPathWithOvalInRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 40, MIN(100, rect.size.width), MIN(200, rect.size.height))];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapButt;
    path.lineJoinStyle = kCGLineJoinMiter;
    
    [path stroke];
}

//创建带有圆角的矩形
- (void)gl_bezierPathWithRoundedRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 40, MIN(100, rect.size.width), MIN(100, rect.size.height)) cornerRadius:10];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapButt;
    path.lineJoinStyle = kCGLineJoinMiter;
    
    [path stroke];
}

//创建有特点圆角的矩形 可以分别设四个角
- (void)gl_speical_bezierPathWithRoundedRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 40, MIN(100, rect.size.width), MIN(200, rect.size.height)) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(100, 100)];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapButt;
    path.lineJoinStyle = kCGLineJoinMiter;
    
    [path stroke];
}

@end
