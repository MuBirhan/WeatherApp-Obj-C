//
//  ViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 13/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SplashViewController.h"

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
        [self performSegueWithIdentifier:@"GoToSecondScreen" sender:nil];
    }];
    
}

@end
