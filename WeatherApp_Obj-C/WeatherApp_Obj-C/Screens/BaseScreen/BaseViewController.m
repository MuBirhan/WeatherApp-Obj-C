//
//  BaseViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)showError:(NSString *)errorMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorMessage
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"")
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showLoading {
    LoadingView *indicator = [LoadingView sharedIndicator];
    if( self.navigationController ) {
        [indicator startLoading];
        [self.navigationController.view addSubview:indicator];
        NSLayoutConstraint *top = [indicator.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor];
        [self.navigationController.view addConstraint:top];
        NSLayoutConstraint *bottom = [indicator.bottomAnchor constraintEqualToAnchor:self.navigationController.view.bottomAnchor];
        [self.navigationController.view addConstraint:bottom];
        NSLayoutConstraint *left = [indicator.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor];
        [self.navigationController.view addConstraint:left];
        NSLayoutConstraint *right = [indicator.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor];
        [self.navigationController.view addConstraint:right];
        top.active = YES;
        bottom.active = YES;
        left.active = YES;
        right.active = YES;
    } else {
        [indicator startLoading];
        [self.view addSubview:indicator];
    }
}

- (void)hideLoading {
    LoadingView *indicator = [LoadingView sharedIndicator];
    [indicator stopLoading];
    [indicator removeFromSuperview];
}

@end
