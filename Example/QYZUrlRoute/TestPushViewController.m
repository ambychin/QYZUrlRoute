//
//  TestPushViewController.m
//  QYZUrlRoute_Example
//
//  Created by Amby Chin on 2018/7/20.
//  Copyright © 2018 ambychin. All rights reserved.
//

#import "TestPushViewController.h"

@interface TestPushViewController ()

@property (nonatomic, strong)   UIButton *buttonDismiss;

@end

@implementation TestPushViewController

+ (instancetype)createdRouteVCWithParams:(NSDictionary *)params {
    TestPushViewController *vc = [[TestPushViewController alloc] init];
    vc.title = [params objectForKey:@"title"];
    vc.view.backgroundColor = [params objectForKey:@"backgroundColor"];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.title isEqualToString:@"Green"]) {
        [self.view addSubview:self.buttonDismiss];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    if (self.routeReCallBlock) {
        self.routeReCallBlock(@{@"text":@"你点了我，我又返回了。吼吼~~~"}, nil);
    }
}

- (void)onClickButton:(UIButton *)button {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (UIButton *)buttonDismiss {
    if (_buttonDismiss == nil) {
        _buttonDismiss = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonDismiss.frame = CGRectMake(20, 220, 100, 40);
        _buttonDismiss.center = self.view.center;
        _buttonDismiss.backgroundColor = [UIColor grayColor];
        _buttonDismiss.titleLabel.font = [UIFont systemFontOfSize:18.0];
        [_buttonDismiss setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonDismiss setTitle:@"Dismiss" forState:UIControlStateNormal];
        [_buttonDismiss addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonDismiss;
}

@end
