//
//  UIViewController+QYZUrlRoute.h
//  UrlRouteSample
//
//  Created by YYDD on 16/7/4.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//
/*
 * 定义了页面跳转时的传参和回调
 */

#import <UIKit/UIKit.h>

//返回给上一个界面的数据，模仿NSNotification发消息，传出2个参数
typedef void (^VCCallBackBlock)(id object, NSDictionary *userInfo);

@interface UIViewController (QYZUrlRoute)

/**
 *  创建vc
 *
 *  @param params 传过去的参数
 *
 *  @return 返回初始化vc
 */
+ (instancetype)createdRouteVCWithParams:(NSDictionary *)params;


@property(nonatomic,copy)VCCallBackBlock routeReCallBlock;


@end
