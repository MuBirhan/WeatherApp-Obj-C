//
//  HomeScreenViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface HomeScreenViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UILabel *sunnyCounter;
@property (weak, nonatomic) IBOutlet UILabel *cloudyCounter;
@property (weak, nonatomic) IBOutlet UILabel *rainingCounter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
