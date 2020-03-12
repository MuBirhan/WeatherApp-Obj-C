//
//  WeatherModel.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "WeatherModel.h"
#import "WeatherAPIModel.h"
#import "WeatherEntity+CoreDataProperties.h"

NSString *const preUrl = @"http://openweathermap.org/img/wn/";
NSString *const postUrl = @"@2x.png";

@implementation WeatherModel

- (instancetype)initWithAPIResponse:(WeatherAPIModel *)model {
    self = [super init];
    if (self) {
        self.city = model.city.name;
        self.region = model.city.country;
        self.temperature = model.list[0].main.temp;
        self.rain = model.list[0].rain.h3;
        self.wind = model.list[0].wind.speed;
        self.mainEvent = model.list[0].weather[0].weatherDescription;
        self.imgUrl = [NSString stringWithFormat:@"%@%@%@", preUrl, model.list[0].weather[0].icon, postUrl];
        self.lon = model.city.coord.lon;
        self.lat = model.city.coord.lat;
        self.time = (long)(NSTimeInterval)(long)(NSTimeInterval)[[NSDate date] timeIntervalSince1970];
    }
    return self;
}

- (instancetype)initWithWeatherEntity:(WeatherEntity *)response {
    self = [super init];
      if (self) {
          self.city = response.city;
          self.region = response.region;
          self.temperature = response.temperature;
          self.rain = response.rain;
          self.wind = response.wind;
          self.mainEvent = response.mainEvent;
          self.imgUrl = response.imgUrl;
          self.lon = response.lon;
          self.lat = response.lat;
          self.time = response.time;
          self.name = response.name;
      }
      return self;
}

@end
