//
//  TabBarController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "TabBarController.h"
#import "UserRepository.h"
#import "CoreDataOperations.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 1;
    [self.navigationController setNavigationBarHidden:YES];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable success) {
        
    } error:^(NSString * _Nullable error) {
        if (error) {
            [[CoreDataOperations new] createTempUser];
        }
    }];
}

@end
