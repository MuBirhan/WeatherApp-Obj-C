//
//  SignInViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SignInViewController.h"
#import "UIColor+CustomColors.h"
#import "UserRepository.h"

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

- (IBAction)signInButtonClicked:(id)sender {
    [self resetErrors];
    if ([self validateFields]) {
        [self showLoading];
        [[UserRepository new] loginUser:self.emailInput.userInput.text withPassword:self.passwordInput.userInput.text success:^{
            [self hideLoading];
            [self performSegueWithIdentifier:@"GoToHomeScreen" sender:nil];
        } error:^(NSString * _Nullable error) {
            [self hideLoading];
            NSLog(@"%@", error);
            [self showError:error];
        }];
    }
}

- (BOOL)validateFields {
    BOOL isValid = YES;
    if ([self.emailInput.userInput.text length] == 0) {
        self.emailInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
    } else if ([self.passwordInput.userInput.text length] == 0) {
        self.passwordInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
    }
    return isValid;
}

- (void)resetErrors {
    self.emailInput.errorMessage.text = @"";
    self.passwordInput.errorMessage.text = @"";
}

@end
