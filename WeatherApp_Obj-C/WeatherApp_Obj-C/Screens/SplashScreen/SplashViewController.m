//
//  ViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 13/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SplashViewController.h"
#import "UserRepository.h"
#import "TabBarController.h"
#import "HomeScreenViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(showSplash:) userInfo:nil repeats:NO];
}

- (void)showSplash:(NSTimer *) timer
{
    [UIView animateWithDuration:1.0f animations:^{
        self.splashImage.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
            if(user) {
                UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarViewController"];
                [self.navigationController setViewControllers:@[controller] animated:YES];
            }
        } error:^(NSString * _Nullable error) {
            [self performSegueWithIdentifier:@"GoToSecondScreen" sender:nil];
        }];
    }];
    
}

@end
