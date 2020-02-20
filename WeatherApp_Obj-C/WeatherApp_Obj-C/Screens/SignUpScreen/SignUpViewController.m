//
//  SignUpViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIColor+CustomColors.h"
#import "UserRepository.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.nextStepButton.backgroundColor = [UIColor greenButton];
    self.nextStepButton.layer.cornerRadius = 25;
    [self.emailInput layoutIfNeeded];
    
    
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signUpButtonClicked:(id)sender {
    [self resetErrors];
    if ([self validateFields]) {
        [self showLoading];
        [[UserRepository new] registerUser:self.emailInput.userInput.text withPassword:self.passwordInput.userInput.text success:^{
            [self hideLoading];
            [self performSegueWithIdentifier:@"GoToLogin" sender:nil];
        } error:^(NSString * _Nullable error) {
            [self hideLoading];
            [self showError:error];
        }];
    }
}
 
- (BOOL)validateFields {
    BOOL isValid = YES;
    if ([self.emailInput.userInput.text  isEqual: @""]) {
        self.emailInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
    } else if ([self.passwordInput.userInput.text  isEqual: @""]) {
        self.passwordInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
    } else if ([self.confirmPasswordInput.userInput.text isEqual: @""]) {
        self.confirmPasswordInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
    } else if (![self.passwordInput.userInput.text  isEqual: self.confirmPasswordInput.userInput.text]) {
        self.confirmPasswordInput.errorMessage.text = NSLocalizedString(@"Passwords must match", @"");
        isValid = NO;
    }
    return isValid;
}

- (void)resetErrors {
    self.emailInput.errorMessage.text = @"";
    self.passwordInput.errorMessage.text = @"";
    self.confirmPasswordInput.errorMessage.text = @"";
}
@end
