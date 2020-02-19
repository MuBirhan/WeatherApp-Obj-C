//
//  SignInViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SignInViewController.h"
#import "UIColor+CustomColors.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signInButton.backgroundColor = [UIColor greenButton];
    self.signInButton.layer.cornerRadius = 25;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
