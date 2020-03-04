//
//  HomeScreenViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 20/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "UIColor+CustomColors.h"
#import "HomeScreenCell.h"
#import "AppDelegate.h"
#import "WeatherModel.h"
#import "WeatherRepository.h"
#import "UserRepository.h"
#import "AppCustomDimens.h"

@interface HomeScreenViewController () {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSMutableArray<WeatherModel *> *items;
    int sunny;
    int cloudy;
    int raining;
}
@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoading];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
        [self hideLoading];
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
    self.locationButton.backgroundColor = [UIColor greenButton];
    self.locationButton.layer.cornerRadius = smallButtonCornerRadius;
    [self setupTableView];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        sunny = 0;
        cloudy = 0;
        raining = 0;
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)fetchData {
    items = [[WeatherRepository new] fetchCDData];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self fetchData];
    [self setupWeatherCounter];
}

-(void)setupTableView {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeScreenCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HomeScreenCell class])];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(void)setupWeatherCounter {
    [self resetWeatherCounter];
    for (int i = 0; i < items.count; i++) {
        NSString *main = items[i].mainEvent;
        if ([main containsString:@"rain"] || [main containsString:@"thunderstorm"] || [main containsString:@"drizzle"]) {
            raining++;
        } else if ([main containsString:@"clouds"]) {
            cloudy++;
        } else if ([main containsString:@"clear"]) {
            sunny++;
        }
        self.sunnyCounter.text = [NSString stringWithFormat:@"%d", sunny];
        self.rainingCounter.text = [NSString stringWithFormat:@"%d", raining];
        self.cloudyCounter.text = [NSString stringWithFormat:@"%d", cloudy];
    }
}

-(void)resetWeatherCounter {
    sunny = 0;
    cloudy = 0;
    raining = 0;
}

#pragma TableView delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeScreenCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeScreenCell class])];
    cell.cellName.text = items[indexPath.row].name;
    cell.regionName.text = items[indexPath.row].region;
    cell.temperature.text = [NSString stringWithFormat:@"%.01f°C", items[indexPath.row].temperature];
    cell.rain.text = [NSString stringWithFormat:@"%.01f%%", items[indexPath.row].rain];
    cell.wind.text = [NSString stringWithFormat:@"%.01f%%", items[indexPath.row].wind];
    cell.timeSinceAdded.text = [self calculateTime:items[indexPath.row].time];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: items[indexPath.row].imgUrl]];
    cell.weatherImage.image = [UIImage imageWithData: imageData];
    cell.colorBackground.backgroundColor = [self loadBackgroundColor:items[indexPath.row].mainEvent];
    return cell;
}

-(UIColor*)loadBackgroundColor:(NSString*)main {
    if ([main containsString:@"rain"] || [main containsString:@"thunderstorm"] || [main containsString:@"drizzle"]) {
        raining++;
        return UIColor.rainyBackgroundColor;
    } else if ([main containsString:@"clouds"]) {
        cloudy++;
        return UIColor.cloudyBackgroundColor;
    } else if ([main containsString:@"clear"]) {
        sunny++;
        return UIColor.sunnyBackgroundColor;
    } else {
        return UIColor.otherBackgroundColor;
    }
}

-(NSString *)calculateTime:(long)time {
    long timeSince = (long)(NSTimeInterval)(long)(NSTimeInterval)[[NSDate date] timeIntervalSince1970];
    timeSince -= time;
    long minutes = timeSince / 60 % 60;
    long hours = timeSince / 60 / 60 % 24;
    long days = timeSince / 60 / 60 / 24;
    return [NSString stringWithFormat:@"%li : %li : %li : %li", days, hours, minutes, timeSince % 60];
}

@end
