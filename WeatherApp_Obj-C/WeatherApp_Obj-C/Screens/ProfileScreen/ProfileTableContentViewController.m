//
//  ProfileTableContentViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "ProfileTableContentViewController.h"
#import "UserRepository.h"

@interface ProfileTableContentViewController ()

@end

@implementation ProfileTableContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
        self.emailLabel.text = user.email;
    } error:^(NSString * _Nullable error) {
        
    }];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        //Logout cell pressed
        [self logoutButtonPressed];
    } else if (indexPath.section == 3) {
        //Temperature cell pressed
        [self changeTemperatureSign];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)changeTemperatureSign {
    UIColor *temp = self.fahrenheitIcon.textColor;
    self.fahrenheitIcon.textColor = self.celsiusIcon.textColor;
    self.celsiusIcon.textColor = temp;
}

- (void)logoutButtonPressed {
    [[UserRepository new] logOutUser:^(BOOL loggedOut) {
        if(loggedOut) {
            UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondScreen"];
            [self.navigationController setViewControllers:@[controller] animated:YES];
        }
    } error:^(NSString * _Nullable error) {
        NSLog(@"%@", error);
    }];
}
@end
