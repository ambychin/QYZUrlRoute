//
//  SDCUrlRouteCenter.m
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "QYZUrlRouteCenter.h"
#import "QYZUrlRouteData.h"

#import "UIApplication+QYZUrlRoute.h"

NSString* localRouteUrl(NSString *routekey)
{
    return [LocalRouteUrlPrefix stringByAppendingString:routekey];
}


@implementation QYZUrlRouteCenter

+(QYZUrlRouteCenter *)sharedCenter
{
    static QYZUrlRouteCenter *urlRouteCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        urlRouteCenter = [[QYZUrlRouteCenter alloc]init];
    });

    return urlRouteCenter;
}

-(instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - public
-(void)open:(NSString *)urlkey animated:(BOOL)animated
{
    [self open:urlkey animated:animated URLRedirectType:kUrlRedirectPush];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{
    [self open:urlkey animated:animated URLRedirectType:type extraParams:nil];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated extraParams:(NSDictionary *)extraParams
{
    [self open:urlkey animated:animated URLRedirectType:kUrlRedirectPush extraParams:extraParams];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type extraParams:(NSDictionary *)extraParams
{
    if ([urlkey isKindOfClass:[NSURL class]]) {
       urlkey = [((NSURL *)urlkey) absoluteString];
    }
    
    if ([[QYZUrlRouteData sharedData] isWebUrl:urlkey]) {
        //判断当前的urlKey 是否是 网址
        
        NSString *urlStr = [[QYZUrlRouteData sharedData] findUrlWithUrlKey:urlkey extraParams:extraParams];
        [self goToWeb:urlStr animated:animated URLRedirectType:type];
    }else
    {
        if (!extraParams) {
            extraParams = [[QYZUrlRouteData sharedData] findParamsContainInUrlKey:urlkey];
        }
        
        UIViewController *vc = [[QYZUrlRouteData sharedData] findVCWithUrlKey:urlkey extraParams:extraParams];
        [self goToVC:vc animated:animated URLRedirectType:type];
    }
}



-(void)closeWithAnimated:(BOOL)animated
{
    [self close:nil animated:animated];
}

-(void)close:(NSString *)url animated:(BOOL)animated
{
    
    if ([UIApplication sharedApplication].currentViewController.navigationController && [UIApplication sharedApplication].currentViewController.navigationController.childViewControllers.count > 1) {
        
        //才可以理解为是popVC
        UIViewController *vc = [[QYZUrlRouteData sharedData]findVCWithUrlKey:url extraParams:nil];
        [self goToVC:vc animated:animated URLRedirectType:kUrlRedirectPop];
    }else
    {
        UIViewController *vc = [[QYZUrlRouteData sharedData]findVCWithUrlKey:url extraParams:nil];
        [self goToVC:vc animated:animated URLRedirectType:kUrlRedirectDismiss];
    }
}




#pragma mark - private Method
-(void)goToWeb:(NSString *)urlStr animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr]];
    
}

-(void)goToVC:(UIViewController *)vc animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{
    switch (type) {
        case kUrlRedirectPop:
            [self popToVC:vc animated:animated];
            break;
        case kUrlRedirectPush:
            [self pushToVC:vc animated:animated];
            break;
        case kUrlRedirectPresent:
            [self presentToVC:vc animated:animated];
            break;
        case kUrlRedirectDismiss:
            [self dismissToVC:vc animated:animated];
            break;
        default:
            [self goToErrorVC];
            break;
    }
}


-(void)popToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (!vc) {
        QYZRoutePopVC(animated);
    }else
    {
        QYZRoutePopToVC(vc, animated);
    }
}

-(void)pushToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (vc) {
        QYZRoutePushToVC(vc, animated);
    }else
    {
        [self goToErrorVC];
    }
}

-(void)presentToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (vc) {
        QYZRoutePresentToVC(vc, animated);
    }else
    {
        [self goToErrorVC];
    }

}
   
-(void)dismissToVC:(UIViewController *)vc animated:(BOOL)animated
{
    QYZRouteDismissToVC(animated);
}




-(void)goToErrorVC
{
    NSLog(@"goToErrorVC");
}

         
@end
