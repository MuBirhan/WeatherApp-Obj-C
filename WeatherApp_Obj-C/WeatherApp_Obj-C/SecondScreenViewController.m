//
//  SecondScreenViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "SecondScreenViewController.h"

@interface SecondScreenViewController ()

@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signInButton.backgroundColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0f];
    self.signInButton.layer.cornerRadius = 25;
    self.signUpButton.backgroundColor = [UIColor colorWithRed:0/255.0 green:111/255.0 blue:255/255.0 alpha:1.0f];
    self.signUpButton.layer.cornerRadius = 25;    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
