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

- (void)viewWillAppear:(BOOL)animated {
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable success) {
        
    } error:^(NSString * _Nullable error) {
        [self showMessage];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)showMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Not logged in!", @"")
                                                                             message:NSLocalizedString(@"Do you want to create an account?",@"")
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"YES", @"")
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction* _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"NO", @"")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        self.tabBarController.selectedIndex = 1;
    }];
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
