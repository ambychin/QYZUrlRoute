//
//  QYZUrlRouteMapping.h
//  UrlRouteSample
//
//  Created by YYDD on 2016/12/1.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYZUrlRouteMapping : NSObject

+ (QYZUrlRouteMapping *)shareInstance;

@property(nonatomic,strong,readonly)    NSDictionary *mappingData;


@end
