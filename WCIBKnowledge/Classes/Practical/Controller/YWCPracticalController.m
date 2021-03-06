//
//  YWCPracticalController.m
//  WCIBKnowledge
//
//  Created by 袁武昌 on 16/6/4.
//  Copyright © 2016年 yuan.com. All rights reserved.
//

#import "YWCPracticalController.h"
#import "YWCPracticalCell.h"

#import "YWCNewsViewController.h"
#import "YWCPhotoViewController.h"
#import "YWCSocialController.h"
@interface YWCPracticalController ()
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation YWCPracticalController

static NSString * const PracticalCellId = @"practical";
- (NSArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = @[@"网易",@"photo",@"友盟"];
    }
    return _titleArr;
}
/**状态栏样式*/
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
/**初始化*/
-(instancetype)init{
    
    //创建一个流水布局
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    //修改布局参数,来修改格子的样式.
    //设置每一个格子的尺寸大小.
    flow.itemSize = CGSizeMake(YWCScreenW , YWCScreenW);
    //设置每一行的最小间距
    flow.minimumLineSpacing = 0;
    //设置每个item之间的最小间距
    flow.minimumInteritemSpacing = 0;
//    flow.sectionInset = UIEdgeInsetsMake(0,10 , 0, 10);
    
    //设置滚动的方向
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return [super initWithCollectionViewLayout:flow];
}


/**注册CollectionViewCell*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background8"]];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background6"]];
    
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //UICollectionViewCell必须得要注册.
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YWCPracticalCell class]) bundle:nil] forCellWithReuseIdentifier:PracticalCellId];
    
    //添加内部的子控件
    //    [self setUp];
}

//有多少组.
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    
    return 1;
}

//第一组当中有多少Items(格子)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArr.count;
}
//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    YWCPracticalCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:PracticalCellId forIndexPath:indexPath];
    
//    NSString *imageName = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    NSString *imageName = [NSString stringWithFormat:@"%d",arc4random_uniform(19) +1];
    cell.backgroundColor = [UIColor clearColor];
    cell.image = [UIImage imageNamed:imageName];
    cell.title_Label = self.titleArr[indexPath.row];
    // 设置圆角半径
    cell.layer.cornerRadius = cell
    .bounds.size.width * 0.5;
    cell.layer.masksToBounds = YES;
    
    // 如果想要做一些牛逼的动画, 可以在这个位置来做
    
    
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI *2);
    animation.keyPath = @"transform.rotation.z";
    animation.duration = 30;
    animation.repeatCount = NSIntegerMax;
    animation.removedOnCompletion = NO;
    [cell.layer addAnimation:animation forKey:@"rotation"];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        YWCNewsViewController *news = [[YWCNewsViewController alloc]init];
        
        news.title = @"网易";
        [self.navigationController pushViewController:news animated:YES];
        
    }else if (indexPath.row == 1){
     
        YWCPhotoViewController *photo = [[YWCPhotoViewController alloc]init];
        
        photo.title = @"Photo";
        [self.navigationController pushViewController:photo animated:YES];
    }else if (indexPath.row == 2){
        
        YWCSocialController *social = [[YWCSocialController alloc]init];
        
        social.title = @"Social";
        [self.navigationController pushViewController:social animated:YES];
    }
}
@end