//
//  HomeScreenViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "UIColor+CustomColors.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoading];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
        [self hideLoading];
        NSLog(@"%@", user.email);
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
    self.locationButton.backgroundColor = [UIColor greenButton];
    self.locationButton.layer.cornerRadius = 20;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
@end
