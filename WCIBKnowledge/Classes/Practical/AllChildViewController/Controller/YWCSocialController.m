//
//  YWCSocialController.m
//  WCIBKnowledge
//
//  Created by 袁武昌 on 16/7/20.
//  Copyright © 2016年 yuan.com. All rights reserved.
//

#import "YWCSocialController.h"
#import <UMSocial.h>
@interface YWCSocialController ()

@end

@implementation YWCSocialController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//第三方分享按钮
- (IBAction)shareBtn:(id)
sender {
    
    YWCLog(@"第三方分享按钮");
    //添加到窗口上面的东西, 我们都是show.
    
    NSArray *snsNames = @[UMShareToDouban, UMShareToSina, UMShareToTencent, UMShareToRenren, UMShareToWechatSession, UMShareToWechatTimeline];
    [UMSocialData defaultData].extConfig.title = @"WCIBKnowledge";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://www.zunars.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"578f626867e58e725c00151c"
                                      shareText:@"梦想还是要有的,万一是实现了呢"
                                     shareImage:[UIImage imageNamed:@"background1"]
                                shareToSnsNames:snsNames
                                       delegate:nil];
    
    
    
    
    
}


//第三方微信登录按钮
- (IBAction)wechatLoginWayBtn:(id)
sender {
    
    YWCLog(@"第三方微信登录按钮");
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            
            NSLog(@"weixin%@",dict);
            
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
    
   
    
    
}
//第三方qq登录按钮
- (IBAction)qqLogin {
    
    YWCLog(@"第三方qq登录按钮");
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            
             NSLog(@"QQ%@",dict);
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
  
}

//第三方sian登录按钮
- (IBAction)sianLogin {
    
   
    YWCLog(@"第三方sian登录按钮");
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            
             NSLog(@"sian%@",dict);
            
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
    
    
}
//第三方豆瓣登录按钮
- (IBAction)douBanLogin
{
    YWCLog(@"第三方豆瓣登录按钮");
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToDouban];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            
             NSLog(@"douban%@",dict);
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
}


/**
 QQ
 username = 子腾,
 usid = DA537CF27CE80152EBA897F4FD31614A,
 token = 2B02A2E424C8760B9706A13EB686361E iconUrl = http://q.qlogo.cn/qqapp/100424468/DA537CF27CE80152EBA897F4FD31614A/100,
 unionId = (null),
 thirdPlatformUserProfile = {
 city = "\U5e7f\U5dde";
 figureurl = "http://qzapp.qlogo.cn/qzapp/100424468/DA537CF27CE80152EBA897F4FD31614A/30";
 "figureurl_1" = "http://qzapp.qlogo.cn/qzapp/100424468/DA537CF27CE80152EBA897F4FD31614A/50";
 "figureurl_2" = "http://qzapp.qlogo.cn/qzapp/100424468/DA537CF27CE80152EBA897F4FD31614A/100";
 "figureurl_qq_1" = "http://q.qlogo.cn/qqapp/100424468/DA537CF27CE80152EBA897F4FD31614A/40";
 "figureurl_qq_2" = "http://q.qlogo.cn/qqapp/100424468/DA537CF27CE80152EBA897F4FD31614A/100";
 gender = "\U7537";
 "is_lost" = 0;
 "is_yellow_vip" = 0;
 "is_yellow_year_vip" = 0;
 level = 0;
 msg = "";
 nickname = "\U5b50\U817e";
 province = "\U5e7f\U4e1c";
 ret = 0;
 vip = 0;
 "yellow_vip_level" = 0;
 },
 thirdPlatformResponse = <TencentOAuth: 0x139030ef0>
 , message = no error
 
 */
/**
 douban
 username = yuan,
 usid = 78453451,
 token = f2db614b421d519dd89223e1c657f4d7 iconUrl = https://img3.doubanio.com/pics/icon/user_icon.jpg,
 unionId = (null),
 thirdPlatformUserProfile = (null),
 thirdPlatformResponse = (null)
 , message = no error
 
 
 */

/**
 weixin
 
 username = ywc900133,
 usid = oyAaTjkoDyeTPA8Qrs51SxRn1WG4,
 token = N27fPi30TjuXw9gOYzRuZE4aCAY5b2mhxV6XZuFM1PK-YGWSX4FjHdRlxYQPwCRbu5dPU24C6PTqXlT-5KtieGfaMlw1Llb7henEcf3wVLU iconUrl = ,
 unionId = o1A_Bjm9liQspgH_lEdBwcc5AuXE,
 thirdPlatformUserProfile = {
 city = "";
 country = "\U4e2d\U56fd";
 headimgurl = "";
 language = "zh_CN";
 nickname = ywc900133;
 openid = oyAaTjkoDyeTPA8Qrs51SxRn1WG4;
 privilege =     (
 );
 province = "";
 sex = 0;
 unionid = "o1A_Bjm9liQspgH_lEdBwcc5AuXE";
 },
 thirdPlatformResponse = <SendAuthResp: 0x137d4efa0>
 , message = (null)
 
 
 */

@end
