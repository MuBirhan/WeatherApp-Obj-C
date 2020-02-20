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
        NSLog(@"%@", user.email);
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
