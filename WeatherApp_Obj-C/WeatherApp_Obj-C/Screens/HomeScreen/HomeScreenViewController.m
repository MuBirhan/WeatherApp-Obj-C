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

@interface HomeScreenViewController () {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSMutableArray<WeatherModel *> *items;
}

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoading];
    [[UserRepository new] getCurrentUser:^(FIRUser * _Nullable user) {
        [self hideLoading];
        NSLog(@"%@", user.email);
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
    [self getContext];
    [self fetchData];
    self.locationButton.backgroundColor = [UIColor greenButton];
    self.locationButton.layer.cornerRadius = 20;
    [self setupTableView];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)setupTableView {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeScreenCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HomeScreenCell class])];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)getContext {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appDelegate.persistentContainer.viewContext;
}

-(void)fetchData {
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"WeatherEntity"];
    NSArray *results = [context executeFetchRequest:requestExamLocation error:nil];
    for (NSDictionary *cdObject in results) {
        [items addObject:[[WeatherModel alloc] initWithCDResponse:cdObject]];
    }
}

#pragma TableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", NSStringFromClass([HomeScreenCell class]));
    HomeScreenCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeScreenCell class])];
    cell.cellName.text = items[indexPath.row].name;
    cell.regionName.text = items[indexPath.row].region;
    cell.temperature.text = [NSString stringWithFormat:@"%.01f°C", items[indexPath.row].temperature];
    cell.rain.text = [NSString stringWithFormat:@"%.01f%", items[indexPath.row].rain];
    cell.wind.text = [NSString stringWithFormat:@"%.01f%", items[indexPath.row].wind];
    cell.timeSinceAdded.text = [NSString stringWithFormat:@"%ld", items[indexPath.row].time];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: items[indexPath.row].imgUrl]];
    cell.weatherImage.image = [UIImage imageWithData: imageData];
    cell.colorBackground.backgroundColor = [self loadBackgroundColor:items[indexPath.row].mainEvent];
    return cell;
}

-(UIColor*)loadBackgroundColor:(NSString*)main {
    if ([main containsString:@"rain"] || [main containsString:@"thunderstorm"] || [main containsString:@"drizzle"]) {
        return UIColor.rainyBackgroundColor;
    } else if ([main containsString:@"clouds"]) {
        return UIColor.cloudyBackgroundColor;
    } else if ([main containsString:@"clear"]) {
        return UIColor.sunnyBackgroundColor;
    } else {
        return UIColor.otherBackgroundColor;
    }
}

@end
