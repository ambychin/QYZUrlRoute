//
//  QYZUrlRouteConfig.h
//  newCampus
//
//  Created by QYZ on 16/3/10.
//  Copyright © 2016年 com.campus.cn. All rights reserved.
//

#ifndef QYZUrlRouteConfig_h
#define QYZUrlRouteConfig_h


typedef enum
{
    kUrlRedirectPush = 1,   /**< push操作 */
    kUrlRedirectPop = 2,    /**< pop操作 */
    kUrlRedirectPresent = 3,    /**< present 操作 */
    kUrlRedirectDismiss = 4,    /**< dismissViewController 操作 */
}UrlRedirectType;




#define QYZRoutePushToVC(ViewController,animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav pushViewController:ViewController animated:animated];


#define QYZRoutePopVC(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popViewControllerAnimated:animated]



#define QYZRoutePopToRoot(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToRootViewControllerAnimated:animated];



#define QYZRoutePopToVC(ViewController,animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToViewController:ViewController animated:animated];



#define QYZRoutePresentToVC(ViewController,animated)\
UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:ViewController];\
[[UIApplication sharedApplication].currentViewController presentViewController:nv animated:animated completion:nil];


#define QYZRouteDismissToVC(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
if(nav == nil){[[UIApplication sharedApplication].currentViewController dismissViewControllerAnimated:animated completion:nil];}else{[[UIApplication sharedApplication].currentViewController.navigationController dismissViewControllerAnimated:animated completion:nil];}\







//配置 跳转的scheme
#define LocalRouteUrlPrefix  @"qyzlocal://"    /**< app内页面跳转的url */
#define ThirdRouteUrlPrefix   @"qyzApp://"   /**< 第三方的跳转到app内 */




#endif /* QYZUrlRouteConfig_h */
