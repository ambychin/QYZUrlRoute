//
//  PPViewController.m
//  QYZUrlRoute
//
//  Created by ambychin on 07/20/2018.
//  Copyright (c) 2018 ambychin. All rights reserved.
//

#import "PPViewController.h"


@interface PPViewController ()

@property (nonatomic, strong)   UIButton *buttonRed;
@property (nonatomic, strong)   UIButton *buttonGreen;
@property (nonatomic, strong)   UIButton *buttonBlue;

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.buttonRed];
    [self.view addSubview:self.buttonGreen];
    [self.view addSubview:self.buttonBlue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClickButton:(UIButton *)button {
    if (_buttonRed == button) {
        [[QYZUrlRouteCenter sharedCenter] open:@"TestPushViewController" animated:YES extraParams:@{@"backgroundColor":[UIColor redColor],@"title":@"Ged"}];
    } else if (_buttonGreen == button) {
        [[QYZUrlRouteCenter sharedCenter] open:@"TestPushViewController" animated:YES URLRedirectType:kUrlRedirectPresent extraParams:@{@"backgroundColor":[UIColor greenColor],@"title":@"Green"}];
    } else if (_buttonBlue == button) {
        [[QYZUrlRouteCenter sharedCenter] open:@"TestPushViewController" animated:YES extraParams:@{@"backgroundColor":[UIColor blueColor],@"title":@"Blue"} WithReloadBlock:^(id object, NSDictionary *userInfo) {
            NSLog(@"WithReloadBlock object = %@",object);
            //注意，如果是在子线程中返回，要更新UI的话，需要切换到主线程中进行
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[object objectForKey:@"text"] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"嘚瑟" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                [self presentViewController:alert animated:YES completion:nil];
            });
        }];
    }
}


- (UIButton *)buttonRed {
    if (_buttonRed == nil) {
        _buttonRed = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonRed.frame = CGRectMake(20, 80, 100, 40);
        _buttonRed.backgroundColor = [UIColor redColor];
        _buttonRed.titleLabel.font = [UIFont systemFontOfSize:18.0];
        [_buttonRed setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonRed setTitle:@"Red" forState:UIControlStateNormal];
        [_buttonRed addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonRed;
}

- (UIButton *)buttonGreen {
    if (_buttonGreen == nil) {
        _buttonGreen = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonGreen.frame = CGRectMake(20, 150, 100, 40);
        _buttonGreen.backgroundColor = [UIColor greenColor];
        _buttonGreen.titleLabel.font = [UIFont systemFontOfSize:18.0];
        [_buttonGreen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonGreen setTitle:@"Green" forState:UIControlStateNormal];
        [_buttonGreen addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonGreen;
}

- (UIButton *)buttonBlue {
    if (_buttonBlue == nil) {
        _buttonBlue = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonBlue.frame = CGRectMake(20, 220, 100, 40);
        _buttonBlue.backgroundColor = [UIColor blueColor];
        _buttonBlue.titleLabel.font = [UIFont systemFontOfSize:18.0];
        [_buttonBlue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonBlue setTitle:@"Blue" forState:UIControlStateNormal];
        [_buttonBlue addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonBlue;
}

@end
