//
//  WeatherModel.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherAPIModel.h"
#import "WeatherEntity+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSString* city;
@property(nonatomic, strong)NSString* region;
@property(nonatomic, assign)double temperature;
@property(nonatomic, assign)double rain;
@property(nonatomic, assign)double wind;
@property(nonatomic, strong)NSString* mainEvent;
@property(nonatomic, strong)NSString* imgUrl;
@property(nonatomic, assign)long time;
@property(nonatomic, assign)double lat;
@property(nonatomic, assign)double lon;

-(instancetype)initWithAPIResponse:(WeatherAPIModel*) model;

-(instancetype)initWithWeatherEntity:(WeatherEntity *)response;

@end

NS_ASSUME_NONNULL_END
