//
//  ProfileTableContentViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTableContentViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *celsiusIcon;
@property (weak, nonatomic) IBOutlet UILabel *fahrenheitIcon;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@end

NS_ASSUME_NONNULL_END
