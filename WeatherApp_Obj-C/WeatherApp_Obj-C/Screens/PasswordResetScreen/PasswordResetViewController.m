//
//  PasswordResetViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 09/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "PasswordResetViewController.h"
#import "AppCustomDimens.h"
#import "UIColor+CustomColors.h"
#import "UserRepository.h"

@interface PasswordResetViewController ()

@end

@implementation PasswordResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetButtonSetup];
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)resetButtonSetup {
    self.resetButton.backgroundColor = [UIColor greenButton];
    self.resetButton.layer.cornerRadius = bigButtonCornerRadius;
}

- (IBAction)resetPasswordButtonPressed:(id)sender {
    [[UserRepository new] forgotPasswordForEmail:self.emailInputView.userInput.text success:^{
        NSLog(@"Success");
    } error:^(NSString * _Nullable error) {
        NSLog(@"Error");
    }];
}

@end
