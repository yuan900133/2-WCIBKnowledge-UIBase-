//
//  YWCDrawPictureController.m
//  WCIBKnowledge
//
//  Created by 袁武昌 on 16/7/21.
//  Copyright © 2016年 yuan.com. All rights reserved.
//

#import "YWCDrawPictureController.h"
#import "UIImage+YWCImage.h"

@interface YWCDrawPictureController ()

@property(nonatomic,strong)UIImageView*imageV521_90;
@property(nonatomic,strong)UIImageView*imageV114_20;
@property(nonatomic,strong)UIImageView*imageV72_12;
@property(nonatomic,strong)UIImageView*imageV57_10;
@property(nonatomic,strong)UIImageView*imageV58_10;
@property(nonatomic,strong)UIImageView*imageV29_9;
@end

@implementation YWCDrawPictureController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//   114
    self.imageV114_20 = [self creatPictureImageWh:114 cornerR:20 color:YWCRandomColor string:@"114"];
    self.imageV114_20.center = CGPointMake(self.view.width *0.8, self.view.height*0.3);
    
    [self.view addSubview:self.imageV114_20];
//    72
    self.imageV72_12 = [self creatPictureImageWh:72 cornerR:12 color:YWCRandomColor string:@"72"];
    self.imageV72_12.center = CGPointMake(self.view.width *0.8, self.view.height*0.1);
    
    [self.view addSubview:self.imageV72_12];
    
//    57
    self.imageV57_10 = [self creatPictureImageWh:57 cornerR:10 color:YWCRandomColor string:@"57"];
    self.imageV57_10.center = CGPointMake(self.view.width *0.5, self.view.height*0.1);
    
    [self.view addSubview:self.imageV57_10];
//    57
    self.imageV58_10 = [self creatPictureImageWh:58 cornerR:10 color:YWCRandomColor string:@"58"];
    self.imageV58_10.center = CGPointMake(self.view.width *0.3, self.view.height*0.1);
    
    [self.view addSubview:self.imageV58_10];
//    29
    self.imageV29_9 = [self creatPictureImageWh:29 cornerR:9 color:YWCRandomColor string:@"29"];
    self.imageV29_9.center = CGPointMake(self.view.width *0.1, self.view.height*0.1);
    
    [self.view addSubview:self.imageV29_9];
    
    
//    保存图片到本地
//    [self saveImage:self.imageV114_20.image imageName:@"/114.png"];
//    [self saveImage:self.imageV72_12.image imageName:@"/72.png"];
//    [self saveImage:self.imageV58_10.image imageName:@"/58.png"];
//    [self saveImage:self.imageV57_10.image imageName:@"/57.png"];
//    [self saveImage:self.imageV29_9.image imageName:@"/29.png"];
    
    
    
}
/**生成一定尺寸的图片*/
- (UIImageView*)creatPictureImageWh:(CGFloat)sizeWh cornerR:(CGFloat)cornerR color:(UIColor*)color string:(NSString *)string {
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.bounds = CGRectMake(0, 0, sizeWh, sizeWh);
    
    //1.先开启一个图片(上下文尺寸大小在原始图片基础上宽高都加上两倍边框宽度.)
    CGSize size = CGSizeMake(sizeWh,sizeWh);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //2.填充一个圆形路径.这个圆形路径大小,和上下文尺寸大小一样.
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, sizeWh, sizeWh) cornerRadius:cornerR];
    //设置边框颜色
    [color set];
    [path fill];
    
    //5.把文字绘制到位图上下文.
    
    NSMutableDictionary *dict = [NSMutableDictionary  dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    dict[NSForegroundColorAttributeName]  = [UIColor whiteColor];
    [string drawAtPoint:CGPointMake(sizeWh*0.3, sizeWh*0.3) withAttributes:dict];
    
    
    
    //画圆角矩形
    //cornerRadius:圆角半径.
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,sizeWh*0.5, sizeWh*0.5) cornerRadius:sizeWh*0.25];
       [YWCRandomColor set];
        [path1 fill];
    
    //画椭圆
        UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(sizeWh*0.25, sizeWh*0.25,sizeWh*0.25, sizeWh*0.5)];
        [YWCRandomColor set];
        [path2 fill];
//    画线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
        [path4 moveToPoint:CGPointMake(0, 0)];
        [path4 addLineToPoint:CGPointMake(sizeWh, sizeWh)];
    [YWCRandomColor set];
    
        [path4 stroke];
    
    //画弧
    //Center:圆心
    //radius:圆的半径
    //startAngle:开始角度
    //endAngle:结束角度.
    //clockwise:顺时针画弧,逆时针画弧,YES,顺时针,NO:逆时针
    //注意:圆心不能使用center, center它的坐是相对于它的父控件.
    CGPoint center =  CGPointMake(sizeWh * 0.5, sizeWh * 0.5);
    CGFloat radius = sizeWh * 0.25;
    UIBezierPath *path5 =  [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    [YWCRandomColor set];
    [path5 stroke];
    
    //画扇形
    //添加一根到圆心.
    [path5 addLineToPoint:center];
    //关闭路径(从路径的终点连接到路径的起点.)
    //    [path closePath];
    //填充时,它会自动的关闭路径.
    [YWCRandomColor set];
    [path5 fill];
    
    //矩形
    UIBezierPath *path6 = [UIBezierPath bezierPathWithRect:CGRectMake(sizeWh*0.5, sizeWh*0.5, sizeWh*0.5, sizeWh*0.5)];
    
    [YWCRandomColor setFill];
    [path6 stroke];
    
    //曲线
    UIBezierPath *path7 = [UIBezierPath bezierPath];
    [path7 moveToPoint:CGPointMake(sizeWh*0.5, sizeWh)];
    [path7 addQuadCurveToPoint:CGPointMake(sizeWh, sizeWh) controlPoint:CGPointMake(sizeWh *0.5, sizeWh*0.5)];
    
    [YWCRandomColor setFill];
    [path7 stroke];
    
    
    
    //5.生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭上下文.
    UIGraphicsEndImageContext();
    
    imageV.image = newImage;
    
//    划线
    
    //1.获取图形上下文.()无论是获取上下文,还是创建上下文都是以 UIGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘制图形(描述路径)贝瑟尔路径.
//    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1,设置路径的起点.
    [path moveToPoint:CGPointMake(imageV.x, imageV.y)];
    //2.2,添加一根到路径的终点.
    [path addLineToPoint:CGPointMake(imageV.width, imageV.height)];
    //一条路径可以描述多条线.
    //    [path moveToPoint:CGPointMake(20, 280)];
    //    [path addLineToPoint:CGPointMake(250, 50)];
    //把上条线的终点当作是下一条线起点.
    [path addLineToPoint:CGPointMake(imageV.x, imageV.height)];
    
    
    
    //3.把路径保存到上下文.
    //UIKit:path ->   CoreGraphics:path
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文当中内容渲染到View. stroke(描边)  fill(填充)
    CGContextStrokePath(ctx);

    
    
    return imageV;
  
}


/**给图片添加边框*/
- (void)imageWithBorder:(UIImageView*)imageV{
//    UIImageView *imageV1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
//    
//    self.imageV1 = imageV1;
//    
//    self.imageV1.image = [UIImage imageWithBorderW:10 corlor:[UIColor redColor] Image:self.imageV1.image];
//    self.imageV1.frame = CGRectMake(0, 0, 100, 100);
//    [self.view addSubview:self.imageV1];
}



/**保存图片*/
- (void)saveImage:(UIImage*)image imageName:(NSString*)name{
    
    //文件名称
    NSString *fileName = @"/Users/yuanwuchang/Desktop/yuan/selfMakePicture";
    
    NSString *filePath = [fileName stringByAppendingString:name];
    //拼接文件的全路径
    
//    NSData *imageData = [NSData dataWithContentsOfFile:fileName];
    
    [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
    
    
    
    
}



@end
