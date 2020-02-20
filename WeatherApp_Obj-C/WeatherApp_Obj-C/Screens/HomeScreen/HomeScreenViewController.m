//
//  HomeScreenViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "HomeScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoading];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
        [self hideLoading];
        self.user.text = user.email;
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
}
@end
