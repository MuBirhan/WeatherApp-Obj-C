//
//  TabBarController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 1;
    [self.navigationController setNavigationBarHidden:YES];
}

@end
