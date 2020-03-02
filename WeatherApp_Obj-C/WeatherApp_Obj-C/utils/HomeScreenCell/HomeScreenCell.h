//
//  HomeScreenCell.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 27/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScreenCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellName;
@property (weak, nonatomic) IBOutlet UILabel *regionName;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *rain;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UILabel *timeSinceAdded;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UIImageView *colorBackground;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

+ (instancetype)loadFromNib;

@end
