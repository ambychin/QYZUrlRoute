//
//  UIApplication+QYZUrlRoute.m
//  UrlRouteSample
//
//  Created by QYZ on 16/7/4.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "UIApplication+QYZUrlRoute.h"
#import <objc/runtime.h>

@implementation UIApplication (QYZUrlRoute)

-(void)setCurrentViewController:(UIViewController *)currentViewController {
    
    objc_setAssociatedObject(self, @selector(currentViewController), currentViewController, OBJC_ASSOCIATION_RETAIN);
}

-(UIViewController *)currentViewController
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
