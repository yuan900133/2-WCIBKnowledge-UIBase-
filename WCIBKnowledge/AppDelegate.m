//
//  AppDelegate.m
//  WCIBKnowledge
//
//  Created by 袁武昌 on 16/6/4.
//  Copyright © 2016年 yuan.com. All rights reserved.
//

#import "AppDelegate.h"

#import "YWCTabBarController.h"
//#import "YWCNewFCollectionViewController.h"
//#import "YWCRootTool.h"

//#import "YWCTabBarController.h"
#import "YWCRootTool.h"

#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialQQHandler.h>


#import "YWCDrawPictureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    


//    self.window.rootViewController = [YWCRootTool choosRootViewController];


    self.window.rootViewController = [YWCRootTool choosRootViewController];

//    self.window.rootViewController= [[YWCTabBarController alloc]init];
    self.window.rootViewController= [[YWCDrawPictureController alloc]init];
    
    [self.window makeKeyAndVisible];
    
    [UMSocialData setAppKey:@"578f626867e58e725c00151c"];
    
    
    
    //设置微信AppId、appSecret，分享url
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.zunars.com"];
    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.zunars.com"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
  
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"486957320"
   secret:@"b18c269832a17aaaf9ed4b267eec2496"
    RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
//    www.zunars.com
    
    return YES;
}

//   配置系统回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
//实现回调方法
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}



@end
