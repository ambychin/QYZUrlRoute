//
//  QYZUrlRouteCenter+DataReload.h
//  newCampus
//
//  Created by QYZ on 16/3/15.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "QYZUrlRouteCenter.h"
#import "UIViewController+QYZUrlRoute.h"
/*
 * 用于设置回调
 */

@interface QYZUrlRouteCenter (DataReload)


/**
 *  url跳转   默认是push 操作
 *
 *  @param urlkey   跳转路径（可以是网址、也可以是协议）
 *  @param animated 是否需要动画
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
WithReloadBlock:(VCCallBackBlock)block;

/**
 *  url跳转   默认是push操作
 *
 *  @param urlkey      跳转路径（可以是网址、也可以是协议）
 *  @param animated    是否需要动画
 *  @param extraParams 额外的参数
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
 extraParams:(NSDictionary *)extraParams
WithReloadBlock:(VCCallBackBlock)block;

/**
 *  url跳转
 *
 *  @param urlkey      跳转路径（可以是网址、也可以是协议）
 *  @param animated    是否需要动画
 *  @param type        跳转动作
 *  @param extraParams 额外的参数
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
URLRedirectType:(UrlRedirectType)type
 extraParams:(NSDictionary *)extraParams
WithReloadBlock:(VCCallBackBlock)block;

/**
 *  url跳转
 *
 *  @param urlkey   跳转路径（可以是网址、也可以是协议）
 *  @param animated 是否需要动画
 *  @param type     跳转动作
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
URLRedirectType:(UrlRedirectType)type
WithReloadBlock:(VCCallBackBlock)block;



@end
