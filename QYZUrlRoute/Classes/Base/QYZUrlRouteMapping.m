//
//  QYZUrlRouteMapping.m
//  UrlRouteSample
//
//  Created by QYZ on 2016/12/1.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "QYZUrlRouteMapping.h"

@interface QYZUrlRouteMapping()

@property(nonatomic,strong) NSDictionary *mappingData;

@end

@implementation QYZUrlRouteMapping

+ (QYZUrlRouteMapping *)shareInstance {
    static QYZUrlRouteMapping *routeMapping = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        routeMapping = [[QYZUrlRouteMapping alloc] init];
    });
    return routeMapping;
}

- (instancetype)init {
    if (self = [super init]) {
        if (!self.mappingData) {
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"QYZUrlRouteFile" ofType:@"plist" inDirectory:nil];
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
            self.mappingData = dict;
        }
    }
    return self;
}

//
//-(NSDictionary *)mappingData {
//
//    //这里可以更新动态更新map
//    if (!_mappingData) {
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"QYZUrlRouteFile" ofType:@"plist" inDirectory:nil];
//        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
//        _mappingData = dict;
//    }
//    return _mappingData;
//
//}

@end
