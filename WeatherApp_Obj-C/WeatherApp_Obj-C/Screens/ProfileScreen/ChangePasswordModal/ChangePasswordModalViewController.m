//
//  ChangePasswordModalViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "ChangePasswordModalViewController.h"
#import "UIColor+CustomColors.h"
#import "AppCustomDimens.h"
#import "UserRepository.h"

@interface ChangePasswordModalViewController ()

@end

@implementation ChangePasswordModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalView.layer.cornerRadius = 20;
    self.modalView.layer.masksToBounds = YES;
    self.changePasswordButton.backgroundColor = [UIColor greenButton];
    self.changePasswordButton.layer.cornerRadius = bigButtonCornerRadius;
    [self setupGestureDetector];
}

- (IBAction)changePasswordButtonPressed:(id)sender {
    [self resetErrors];
    if ([self validateFields]) {
        [self showLoading];
        [[UserRepository new] changePassword:self.passwordInput.userInput.text success:^{
            [self dismissViewControllerAnimated:YES completion:nil];
            [self hideLoading];
        } error:^(NSString * _Nullable error) {
            [self showError:error];
            [self hideLoading];
        }];
    }
}

-(BOOL)validateFields {
    BOOL isValid = YES;
    if([self.passwordInput.userInput.text length] == 0) {
        self.passwordInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
        
    } else if ([self.confirmPasswordInput.userInput.text length] == 0) {
        self.confirmPasswordInput.errorMessage.text = NSLocalizedString(@"Field cannot be empty", @"");
        isValid = NO;
        
    } else if (![self.passwordInput.userInput.text isEqualToString: self.confirmPasswordInput.userInput.text]) {
        self.confirmPasswordInput.errorMessage.text = NSLocalizedString(@"Passwords must match", @"");
        isValid = NO;
    }
    return isValid;
}

- (void)resetErrors {
    self.passwordInput.errorMessage.text = @"";
    self.confirmPasswordInput.errorMessage.text = @"";
}

#pragma GestureDetector delegate methods
-(void)setupGestureDetector {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
     tap.numberOfTouchesRequired = 1;
     tap.numberOfTapsRequired = 1;
     tap.cancelsTouchesInView = false;
     tap.delegate = self;
     [self.view addGestureRecognizer:tap];
}

-(void)onTap:(UIGestureRecognizer *)sender {
    [self.modalView.window removeGestureRecognizer:sender];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint location = [touch locationInView:self.modalView];
    if ([self.modalView pointInside:location withEvent:nil]) {
        return NO;
    } else {
        return YES;
    }
}

@end
