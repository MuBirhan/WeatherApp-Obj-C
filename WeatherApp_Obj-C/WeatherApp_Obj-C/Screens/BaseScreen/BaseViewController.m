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
        [self.navigationController.view layoutIfNeeded];
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
