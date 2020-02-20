//
//  SecondScreenViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SecondScreenViewController.h"
#import "UIColor+CustomColors.h"

@interface SecondScreenViewController ()

@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signInButton.backgroundColor = [UIColor greenButton];
    self.signInButton.layer.cornerRadius = 25;
    self.signUpButton.backgroundColor = [UIColor blueButton];
    self.signUpButton.layer.cornerRadius = 25;    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

@end
