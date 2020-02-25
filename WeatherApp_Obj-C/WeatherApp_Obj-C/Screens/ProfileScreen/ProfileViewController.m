//
//  ProfileViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "ProfileViewController.h"
#import "UserRepository.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)logoutButtonPressed:(id)sender {
    [[UserRepository new] logOutUser:^(BOOL loggedOut) {
        if(loggedOut) {
            UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondScreen"];
            [self.navigationController setViewControllers:@[controller] animated:YES];
        }
    } error:^(NSString * _Nullable error) {
        [self showError:error];
    }];
}
@end
